# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=neatvnc-git
pkgver=0.4.0
pkgrel=2
pkgdesc="VNC server library that's intended to be fast and neat"
arch=(x86_64 i686 aarch64 armv7h)
url=https://github.com/any1/neatvnc
license=(custom:ISC)
depends=(libglvnd libxkbcommon pixman aml-git gnutls libjpeg-turbo)
makedepends=(git meson ninja libdrm)
source=("git+$url")
sha512sums=('SKIP')
conflicts=(neatvnc)
provides=(neatvnc=${pkgver%+*})

pkgver() {
  git -C neatvnc describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  arch-meson neatvnc build # --prefix /usr
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 neatvnc/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
