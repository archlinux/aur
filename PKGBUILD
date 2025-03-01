# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="aescrypt"
pkgname="${_name}-gui"
pkgver=4.2.2
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption (AES) standard - GUI"
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
        "${_pkgsrc}.tar.gz::${url}/download/v${pkgver%%.*}/linux/${pkgname//-/_}-${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('ddcb3ec8ff4dfb43ae5f37d4ba9ffda23f3365ec03491a36e08240cd19fda739'
            '9f79b203ba3cea6e4c2c0202951397ef169d05532b1dc5e8631165344350d0d7')
# validpgpkeys=('C264DC0F1C13A4BB18CAAF1BE7BE982BCD50DDF4') # Terrapane Support <support@terrapane.com> (https://github.com/terrapane/aescrypt_linux/blob/master/README.md#signed-release-packages)

prepare() {
  cd "${srcdir}/${pkgname//-/_}-${pkgver}-Linux-x86_64"
  rm -rf "bin/${_name}" "share/man"
  
  cd "share/applications"
  sed -i 's|^Icon=.*|Icon='"${_name}|" "${_name}.desktop"
}

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

  cd "${pkgname//-/_}-${pkgver}-Linux-x86_64"
  find "bin"   -type f -exec install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;
}
