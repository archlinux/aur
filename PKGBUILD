# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="aescrypt"
pkgname="${_name}-gui"
pkgver=4.2.3
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
        "${_pkgsrc}.tar.gz::${url}/download/v${pkgver%%.*}/linux/${pkgname//-/_}-${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('777bb24d99051038676bd1faa4947171165a8af84f195479e1cf93858ea069e8'
            '7d5efd9b1ba27bb4557178dea82e9759c3732008765269d0706cbe7b0a39c380')
# validpgpkeys=('C264DC0F1C13A4BB18CAAF1BE7BE982BCD50DDF4') # Terrapane Support <support@terrapane.com> (https://github.com/terrapane/aescrypt_linux/blob/master/README.md#signed-release-packages)

prepare() {
  cd "${srcdir}/${pkgname//-/_}-${pkgver}-Linux-x86_64"
  rm -rf "bin/${_name}" "share/man"
  
  # cd "share/applications"
  # sed -i 's|^Icon=.*|Icon='"${_name}|" "${_name}.desktop"
}

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

  cd "${pkgname//-/_}-${pkgver}-Linux-x86_64"
  find "bin"   -type f -exec install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;
}
