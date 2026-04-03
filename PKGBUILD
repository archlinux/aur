# Maintainer: Natounlars <198830487@qq.com>
pkgname=libeot-git
pkgver=v0.01.r23.g18ec31c
pkgrel=1
pkgdesc="Library for parsing Embedded OpenType files"
arch=('x86_64')
url="https://github.com/umanwizard/libeot"
license=('MPL-2.0')
depends=('glibc')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'pkgconf')
source=("git+https://github.com/umanwizard/libeot.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/libeot"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$srcdir/libeot"
  autoreconf --install
}

build() {
  cd "$srcdir/libeot"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/libeot"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
