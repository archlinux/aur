# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Stephen Gregoratto <dev@sgregoratto.me>

pkgname=wev-git
pkgver=1.1.0.r1.gb09b664
pkgrel=1
pkgdesc='A tool for debugging wayland events on a Wayland window, analagous to the X11 tool xev'
url=https://git.sr.ht/~sircmpwn/wev
license=(MIT)
#arch=(x86_64)
arch=(i686 x86_64 armv6h armv7h)
depends=(wayland libxkbcommon)
makedepends=(git scdoc wayland-protocols)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # LDFLAGS are not respected
  make -C $pkgname CFLAGS="$CFLAGS $LDFLAGS"
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" PREFIX=/usr MANDIR=/usr/share/man install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
