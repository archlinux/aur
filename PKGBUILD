# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="aescrypt"
_pkgname="${_name}-gui"
pkgname="${_pkgname}-bin"
pkgver=4.0.6
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption (AES) standard - GUI"
arch=('any')
url="https://www.aescrypt.com"
license=('custom:Commercial')
depends=('aescrypt' 'hicolor-icon-theme' 'perl')
optdepends=('zenity: GTK-based password prompt'
            'kdialog: Qt-based password prompt')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# validpgpkeys=('C264DC0F1C13A4BB18CAAF1BE7BE982BCD50DDF4') # Terrapane Support <support@terrapane.com> (https://github.com/terrapane/aescrypt_linux/blob/master/README.md#signed-release-packages)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/download/v${pkgver%%.*}/linux/${_pkgname//-/_}-${pkgver}-Linux-x86_64.tar.gz")
b2sums=('98649c74ed7ea7ec09905ff449dd7cc81488ae020a5b4a875e44c2cbe3ff39e23fbb5c6e8aa6ecbfae3b3690844da1410144b9e1352954bb0439485631192105')

prepare() {
  cd "${srcdir}/${_pkgname//-/_}-${pkgver}-Linux-x86_64"
  rm -rf "bin/${_name}" "share/man"
  
  cd "share/applications"
  sed -i 's|^Icon=.*|Icon=aescrypt|' "${_name}.desktop"
}

package() {
  cd "${srcdir}/${_pkgname//-/_}-${pkgver}-Linux-x86_64"
  find "bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/{}" \;
}
