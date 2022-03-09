pkgname=cmos-git
pkgver=v1.0.r1.g1a633e0
pkgrel=1
pkgdesc='Small markdown renderer based on CommonMark libcmark'
arch=(x86_64)
url='https://sr.ht/~bitfehler/cmos'
license=(MIT)
depends=(
  'libunistring'
  'cmark'
  'source-highlight'
)
makedepends=(git meson ninja)
provides=('cmos')
conflicts=('cmos')

source=("${pkgname}::git+https://git.sr.ht/~bitfehler/cmos")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  arch-meson build "$pkgname"
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim: ts=2 sw=2 et
