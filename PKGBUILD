# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=wayvnc-git
pkgver=0.2.0
pkgrel=1
pkgdesc='VNC server for wlroots-based Wayland compositors'
arch=(x86_64 i686)
url=https://github.com/any1/wayvnc
license=(custom:ISC)
depends=(libglvnd libxkbcommon libuv pixman neatvnc-git)
makedepends=(git meson ninja aml-git)
source=("git+$url")
sha512sums=('SKIP')
conflicts=(wayvnc)
provides=(wayvnc=${pkgver%+*})

pkgver() {
  git -C wayvnc describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  arch-meson wayvnc build # --prefix /usr
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 wayvnc/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
