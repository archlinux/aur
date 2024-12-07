# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="aescrypt"
_pkgname="${_name}-gui"
pkgname="${_pkgname}-bin"
pkgver=4.1.0
_commit="a125906e360537a612e4c698f7ed76faf6a18173"
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption (AES) standard - GUI"
arch=('any')
url="https://www.aescrypt.com"
_url="https://github.com/terrapane/aescrypt_linux"
license=('custom:Commercial')
depends=('aescrypt' 'hicolor-icon-theme' 'perl')
optdepends=('zenity: GTK-based password prompt'
            'kdialog: Qt-based password prompt')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("CHANGELOG-${pkgver}.md::${_url}/raw/${_commit}/CHANGELOG.md"
        "${_pkgsrc}.tar.gz::${url}/download/v${pkgver%%.*}/linux/${_pkgname//-/_}-${pkgver}-Linux-x86_64.tar.gz")
b2sums=('1d860efeec4911bd98bbdee0d8ea76027bea32b426b075b8dbd86b6d37cc5b95fb9c4fb36a9d2afd0d6c933897eb0ea74a7357bc7be9c020988e376aa7f5b47a'
        '8d0b627548c6c85a9990a33a1a3d13672a7fed6ddfe6c2a2b9da2043aec7a67e372471b63c4e048c2587d01e11aef6c03dcac698a2649afa98b22d9fce283160')
# validpgpkeys=('C264DC0F1C13A4BB18CAAF1BE7BE982BCD50DDF4') # Terrapane Support <support@terrapane.com> (https://github.com/terrapane/aescrypt_linux/blob/master/README.md#signed-release-packages)

prepare() {
  cd "${srcdir}/${_pkgname//-/_}-${pkgver}-Linux-x86_64"
  rm -rf "bin/${_name}" "share/man"
  
  cd "share/applications"
  sed -i 's|^Icon=.*|Icon=aescrypt|' "${_name}.desktop"
}

package() {
  cd "${srcdir}"
  install -vDm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"

  cd "${_pkgname//-/_}-${pkgver}-Linux-x86_64"
  find "bin"   -type f -exec install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;
}
