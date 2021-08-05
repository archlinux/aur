# Maintainer: Tim Lagnese tim@inept.tech

pkgname=gameoftrees-git
pkgver=r3550.fe5032d2
pkgrel=1
pkgdesc="A version control system which prioritizes ease of use and simplicity over flexibility."
arch=('x86_64')
url="http://gameoftrees.org/"
license=('ISC')
depends=('ncurses' 'libmd' 'util-linux-libs' 'zlib' 'libbsd')
makedepends=('pkgconf' 'git')
conflicts=('got' 'got-bin' 'got-git')
source=('gameoftrees::git+https://git.gameoftrees.org/got-portable.git#branch=linux')
sha256sums=('SKIP')

pkgver()
{
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  make DESTDIR="$pkgdir/" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "$srcdir/${pkgname%-git}/LICENCE"
}

# vim:set ts=2 sw=2 et:

