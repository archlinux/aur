# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="aescrypt"
pkgname="${_name}-gui"
pkgver=4.3.1
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption Standard (AES) - GUI"
arch=('any')
url="https://www.aescrypt.com"
_url="https://github.com/terrapane/aescrypt_linux"
license=('custom:Commercial')
depends=("aescrypt>=${pkgver}" 'hicolor-icon-theme' 'perl')
optdepends=('kdialog: Qt-based password prompt'
            'zenity: GTK-based password prompt')
replaces=("${pkgname}-bin")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-x86_64.tar.gz::${url}/download/v${pkgver%%.*}/linux/${pkgname//-/_}-${pkgver}-Linux-x86_64.tar.gz"
        "${_pkgsrc}-x86_64.tar.gz.sig::${url}/download/v${pkgver%%.*}/linux/${pkgname//-/_}-${pkgver}-Linux-x86_64.tar.gz.sig")
sha256sums=('02fe9041adea3fbebfa4c53f85c9c085ca2628d97fcdf2a4d830f183b1d7aa9a'
            '8bc17650b41c792560784260a80169e1d1a0bac735178ec0170f5f01dfdebe43'
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
