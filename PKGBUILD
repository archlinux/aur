# Maintainer: Marcel B <mr.arsikoff@gmail.com>
pkgname="sddm-silent-theme"
_upstreamname="SilentSDDM"
pkgdesc="Highly customizable SDDM theme"
pkgver=1.4.2
pkgrel=1
arch=('any')
depends=('sddm' 'qt6-svg' 'qt6-virtualkeyboard' 'qt6-multimedia-ffmpeg' 'qt6-declarative' 'redhat-fonts')
url="https://github.com/uiriansan/${_upstreamname}"
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('058dd0326dad06f23906bd8d42572126339ec90c1053d2d52a1b9ac3f0bea991')
_installdir="usr/share/sddm/themes/silent"
backup=("${_installdir}/metadata.desktop")
install="warning.install"

package() {
  cd "${_upstreamname}-${pkgver}"
  rm install.sh
  # docs/ contains the screenshot for the theme
  # rm -r docs
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
