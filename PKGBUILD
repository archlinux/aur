# Maintainer: Dylan Araps <dyl@tfwno.gf>
pkgname=neofetch-git
_pkgname=neofetch
pkgver=1.0.r26.g9bde0eb
pkgrel=1
pkgdesc="CLI script to show your system's info and display an image using w3m."
arch=('any')
url="https://github.com/dylanaraps/neofetch"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('bash' 'xorg-xprop')
optdepends=(
  'cmus: Current Song'
  'feh: Wallpaper Display'
  'imagemagick: Image cropping / Thumbnail creation'
  'mpc: Current Song'
  'moc: Current Song'
  'nitrogen: Wallpaper Display'
  'scrot: Take a screenshot'
  'w3m: Display Images'
  'xorg-xdpyinfo: Resolution Detection'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/dylanaraps/neofetch.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/neofetch/LICENSE.md"
}
