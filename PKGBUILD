# Maintainer: Marcel B <mr.arsikoff@gmail.com>
pkgname="sddm-silent-theme"
upstreamname="SilentSDDM"
pkgdesc="Highly customizable SDDM theme"
pkgver=1.4.1
pkgrel=1
arch=('any')
depends=('sddm' 'qt6-svg' 'qt6-virtualkeyboard' 'qt6-multimedia-ffmpeg' 'redhat-fonts')
url="https://github.com/uiriansan/$upstreamname"
license=('GPL-2.0-only')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('de55a3a38784370a49883ce2abcc01913b6a8a9103bec0563164c336ee88f998')
installdir="usr/share/sddm/themes/silent"
backup=("$installdir/metadata.desktop")
install="warning.install"

package() {
  cd "$upstreamname-$pkgver"
  rm install.sh
  # docs/ contains the screenshot for the theme
  # rm -r docs
  rm -rf .github
  rm -r fonts # not used by the theme from that directory. satisfied by redhat-fonts
  rm -f ./*.nix
  rm -f ./flake.lock
  mkdir -p "$pkgdir/$installdir"
  cp -r ./* "$pkgdir/$installdir"
  find "$pkgdir/$installdir" -type d -exec chmod 755 {} +
  find "$pkgdir/$installdir" -type f -exec chmod 644 {} +
  chmod +x "$pkgdir/$installdir/"*.sh
}
