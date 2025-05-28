# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="aescrypt"
pkgname="${_name}-gui"
pkgver=4.3.0
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption Standard (AES) - GUI"
arch=('any')
url="https://www.aescrypt.com"
_url="https://github.com/terrapane/aescrypt_linux"
license=('custom:Commercial')
depends=('aescrypt' 'hicolor-icon-theme' 'perl')
optdepends=('kdialog: Qt-based password prompt'
            'zenity: GTK-based password prompt')
replaces=("${pkgname}-bin")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}.tar.gz::${url}/download/v${pkgver%%.*}/linux/${pkgname//-/_}-${pkgver}-Linux-x86_64.tar.gz"
        "${_pkgsrc}.tar.gz.sig::${url}/download/v${pkgver%%.*}/linux/${pkgname//-/_}-${pkgver}-Linux-x86_64.tar.gz.sig")
sha256sums=('da3b2ab3f52f7485bb1cf0d13c503d8c6858f58ed874e52efc3110939ee844a9'
            'c8856ec1148a3e8d21492de07b6f37fd6616525c6ff6d53659e9140e317195c0'
            'SKIP')
validpgpkeys=('C264DC0F1C13A4BB18CAAF1BE7BE982BCD50DDF4') # Terrapane Support <support@terrapane.com> (https://www.aescrypt.com/download/)

prepare() {
  cd "${srcdir}/${pkgname//-/_}-${pkgver}-Linux-x86_64"
  rm -rf "bin/${_name}" "share/man" "share/licenses"
}

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

  cd "${pkgname//-/_}-${pkgver}-Linux-x86_64"
  find "bin"   -type f -exec install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;
}
