# Maintainer: ForumPlayer <fp+aur@forumplayer.dev>
# Maintainer: Dylan Araps <dyl@tfwno.gf>
# neofetch-git AUR PKGBUILD - https://aur.archlinux.org/packages/neofetch-git/
# Frogged by Tk-Glitch <tkg@froggi.es>
pkgname=neofrog-git
_pkgname=neofetch
pkgver=7.0.0.r46.gc8e08cd7
pkgrel=1
pkgdesc="A CLI system information tool written in BASH that supports displaying images."
arch=('any')
url="https://github.com/Frogging-Family/${pkgname}"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('bash')
optdepends=(
  'feh: Wallpaper Display'
  'imagemagick: Image cropping / Thumbnail creation / Take a screenshot'
  'nitrogen: Wallpaper Display'
  'w3m: Display Images'
  'catimg: Display Images'
  'jp2a: Display Images'
  'libcaca: Display Images'
  'xdotool: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
  'xorg-xdpyinfo: Resolution detection (Single Monitor)'
  'xorg-xprop: Desktop Environment and Window Manager'
  'xorg-xrandr: Resolution detection (Multi Monitor + Refresh rates)'
  'xorg-xwininfo: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/dylanaraps/neofetch.git"
        "frog.patch")
md5sums=('SKIP'
         'a3fa5aeed248b78b27e351e3421d9ca5')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
  cd "$pkgname"

  patch -Np1 < "$srcdir"/frog.patch
  
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/neofetch/LICENSE.md"
}
