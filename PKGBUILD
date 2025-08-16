# Maintainer: Marcel B <mr.arsikoff@gmail.com>
pkgname="sddm-silent-theme"
_upstream_name="SilentSDDM"
pkgdesc="Highly customizable SDDM theme"
pkgver=1.3.4
pkgrel=1
arch=('any')
depends=('sddm' 'qt6-svg' 'qt6-virtualkeyboard' 'qt6-multimedia-ffmpeg' 'redhat-fonts')
url='https://github.com/uiriansan/SilentSDDM'
license=('GPL-2.0-only')
source=("https://github.com/uiriansan/SilentSDDM/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ccba59bd1d298be0144fb0251ce9edae450e9e0ac6ae5eca30b6787825075202')
backup=('usr/share/sddm/themes/silent/metadata.desktop')

package() {
  cd "$_upstream_name-$pkgver"
  rm install.sh
  # docs/ contains the screenshot for the theme
  # rm -r docs
  rm -rf .github
  rm -r fonts # not used by the theme from that directory. satisfied by redhat-fonts
  rm -f ./*.nix
  mkdir -p "$pkgdir/usr/share/sddm/themes/silent"
  cp -r ./* "$pkgdir/usr/share/sddm/themes/silent"
  find "$pkgdir/usr/share/sddm/themes/silent" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/sddm/themes/silent" -type f -exec chmod 644 {} +
}
