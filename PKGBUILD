# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="aescrypt"
_pkgname="${_name}-gui"
pkgname="${_pkgname}-bin"
pkgver=4.0.7
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
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/download/v${pkgver%%.*}/linux/${_pkgname//-/_}-${pkgver}-Linux-x86_64.tar.gz")
b2sums=('91354a1554c069d638ed5a60e9b52d22078c8f90e97b7d277aa308304c8c168e6d9be84a97ebd59ef9f26ca96cb17b43d3e1e2f4f2ab06bcb88dd861e03db3ae')
# validpgpkeys=('C264DC0F1C13A4BB18CAAF1BE7BE982BCD50DDF4') # Terrapane Support <support@terrapane.com> (https://github.com/terrapane/aescrypt_linux/blob/master/README.md#signed-release-packages)

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
