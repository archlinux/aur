# Maintainer: Dylan Araps <dyl@tfwno.gf>
pkgname=fetch-git
_pkgname=fetch
pkgver=1.0.r26.g9bde0eb
pkgrel=1
pkgdesc="CLI script to show your system's info and display an image using w3m."
arch=('any')
url="https://github.com/dylanaraps/fetch"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('bash' 'ncurses')
optdepends=(
    'cmus: Current Song'
    'feh: Wallpaper Display'
    'imagemagick: Image cropping / Thumbnail creation'
    'mpc: Current Song'
    'nitrogen: Wallpaper Display'
    'scrot: Take a screenshot'
    'w3m: Display Images'
    'xorg-xprop: Accurate window manager detection'
    'wmctrl: Accurate window manager detection'
    'xorg-xdpyinfo: Resolution Detection'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/dylanaraps/fetch.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
  cd $pkgname
  install -D -m755 fetch "$pkgdir/usr/bin/fetch"
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/fetch/LICENSE.md"
  install -D -m755 config "$pkgdir/usr/share/fetch/config"
  install -d -m755 ascii/distro/ "$pkgdir/usr/share/fetch/ascii/distro"
  install -D -m755 ascii/distro/* "$pkgdir/usr/share/fetch/ascii/distro/"
}
