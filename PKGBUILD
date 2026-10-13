# Maintainer: Marcel B <mr.arsikoff@gmail.com>
pkgname="sddm-silent-theme"
_upstreamname="SilentSDDM"
pkgdesc="Highly customizable SDDM theme"
pkgver=1.5.1
pkgrel=1
arch=('any')
depends=('sddm' 'qt6-svg' 'qt6-virtualkeyboard' 'qt6-multimedia-ffmpeg' 'qt6-declarative' 'qt6-imageformats' 'redhat-fonts')
url="https://github.com/uiriansan/${_upstreamname}"
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('064946d9ea9419db8c984fc250a13ea006212529911f9e8359f8a99867a3eddd')
_installdir="usr/share/sddm/themes/silent"
backup=("${_installdir}/metadata.desktop")

package() {
  cd "${_upstreamname}-${pkgver}"
  rm install.sh
  rm .gitignore
  rm README.md
  rm LICENSE
  rm -rf .github
  rm -r fonts # not used by the theme from that directory. satisfied by redhat-fonts
  rm -f ./*.nix
  rm -f ./flake.lock
  install -d "${pkgdir}/${_installdir}"
  cp -r ./* "${pkgdir}/${_installdir}"
  find "${pkgdir}/${_installdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}/${_installdir}" -type f -exec chmod 644 {} +
  chmod +x "${pkgdir}/${_installdir}/"*.sh || true
}
