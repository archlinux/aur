# Maintainer: Tanishq (Trifalic47) <trifalicapt@gmail.com>
pkgname=rmpv-git
pkgver=r31.0a3f8c2
pkgrel=1
pkgdesc="Terminal-based mpv YouTube/music player with rmpc integration"
arch=('x86_64')
url="https://github.com/Trifalic47/rmpv"
license=('MIT')

depends=('mpv' 'yt-dlp' 'mpc' 'mpd' 'rofi' 'rmpc')
makedepends=('git')

provides=('rmpv')
conflicts=('rmpv')

install=rmpv.install

source=("$pkgname::git+https://github.com/Trifalic47/rmpv.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  install -Dm755 bin/rmpv        "$pkgdir/usr/bin/rmpv"
  install -Dm755 bin/rmpv-play   "$pkgdir/usr/bin/rmpv-play"
  install -Dm755 bin/rmpv-search "$pkgdir/usr/bin/rmpv-search"

  install -Dm755 scripts/rmpv-setup.sh "$pkgdir/usr/bin/rmpv-setup"

  install -d "$pkgdir/usr/share/rmpv"
  cp -r dots "$pkgdir/usr/share/rmpv/dots"

  install -Dm644 README.md "$pkgdir/usr/share/doc/rmpv/README.md"
}
