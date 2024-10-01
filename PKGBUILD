# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aescrypt"
pkgname="${_pkgname}-bin"
pkgver=4.0.6
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption (AES) standard"
arch=('x86_64')
url="https://www.aescrypt.com"
_url="https://github.com/terrapane/aescrypt_cli"
license=('custom:Commercial')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# validpgpkeys=('C264DC0F1C13A4BB18CAAF1BE7BE982BCD50DDF4') # Terrapane Support <support@terrapane.com> (https://github.com/terrapane/aescrypt_linux/blob/master/README.md#signed-release-packages)
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "CHANGELOG-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "LICENSE-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/LICENSE.md")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/download/v${pkgver%%.*}/linux/${_pkgname}_cli-${pkgver}-Linux-x86_64.tar.gz")
b2sums=('5c2bf1efad8b8ab5b20ebec0eb0169a26bf18f87d2904db17dba3b72b8c7e1838cf29965bec8cc63ea4c77faeb0a1f65b27661703a43af4b8799bf7443359a81'
        '102193837303d9836d0dfddd21329f2fd8cbc71fc0ea5002a00ea45017fde19c407aae223fb4a530c0c28222b038e72063b96cc021a6dd47a42dd6939d88da92'
        '6cd45abeece31c6a176fed9972b7d25fc1920c4a6d71f27710409ecf52250180771949317a04f9642dc7efb7faa201ecd2298dcd49b0a2e9ff2fe1aa811e4060')
b2sums_x86_64=('28e96e6d6c21cdd17f8d1271dffab8ce98de4dcc889b2d0e21db6469d8490995a7716964d8ab35f8e1892001bf394e02b1aaefc4ce45fc8f7f99a9ebc0042892')

package() {
  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -Dm644 "LICENSE-${pkgver}.md"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  
  cd "${_pkgname}_cli-${pkgver}-Linux-${CARCH}"
  find "bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/{}" \;
}
