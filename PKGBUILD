# Maintainer: Syaoran Code <syaorancode@gmail.com>

pkgname=srfetch-git
_dir=srfetch
pkgver=7.0.0.r1.b0bb11c
pkgrel=1
pkgdesc="This is modified neofetch script only for me."
arch=(x86_64 i686)
url="https://github.com/justanoobcoder/srfetch.git"
license=('MIT')
depends=(bash)
makedepends=(make)
backup=('etc/srfetch/config.conf')
optdepends=(
  'catimg: Display Images'
  'chafa: Image to text support'
  'feh: Wallpaper Display'
  'imagemagick: Image cropping / Thumbnail creation / Take a screenshot'
  'jp2a: Display Images'
  'libcaca: Display Images'
  'nitrogen: Wallpaper Display'
  'pacman-contrib: Display package count'
  'w3m: Display Images'
  'xdotool: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
  'xorg-xdpyinfo: Resolution detection (Single Monitor)'
  'xorg-xprop: Desktop Environment and Window Manager'
  'xorg-xrandr: Resolution detection (Multi Monitor + Refresh rates)'
  'xorg-xwininfo: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "${_dir}"
    printf "%s.r%s.%s" "$(awk -F'=' '/^version=/ {print $2}' srfetch)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_dir}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
