# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aescrypt"
pkgname="${_pkgname}-bin"
pkgver=4.2.2
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption Standard (AES)"
arch=('x86_64')
url="https://www.aescrypt.com"
_url="https://github.com/terrapane/aescrypt_cli"
license=('custom:Commercial')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE.md::${_url}/raw/refs/tags/v${pkgver}/LICENSE.md")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/download/v${pkgver%%.*}/linux/${_pkgname}_cli-${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('e3ed43a08414360b7e09d9e82f4fb2b3a2567e086c9f604f6c7976c507db09cc'
            'a14eaa86c602086e360db6ab07a8cb9eefa2d1bfbdf1432c303b7adf4cb83675'
            'a9102d646bc5718dfba8a77179973ee2308aef66a788c0411c930d5bcbe711ce')
sha256sums_x86_64=('7f29ea9cdd33863616b26d89192eb3cf3395cd45582c85dc8c138887032be571')
# validpgpkeys=('C264DC0F1C13A4BB18CAAF1BE7BE982BCD50DDF4') # Terrapane Support <support@terrapane.com> (https://github.com/terrapane/aescrypt_linux/blob/master/README.md#signed-release-packages)

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  
  cd "${_pkgname}_cli-${pkgver}-Linux-${CARCH}"
  find "bin"   -type f -exec install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;
}
