pkgname=zenith-git
pkgver=r364.3400294
pkgrel=1
pkgdesc='In terminal graphical metrics for your *nix system written in Rust'
arch=('x86_64')
url='https://github.com/bvaisvil/zenith'
license=('MIT')
depends=()
makedepends=('git' 'rust')
provides=('zenith')
conflicts=('zenith' 'zenith-bin')

source=("git+https://github.com/bvaisvil/zenith.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make install PREFIX=/usr DESTDIR="${pkgdir}"
  install -D -m 644 README.md "${pkgdir}/usr/share/doc/zenith/README.md"
}
