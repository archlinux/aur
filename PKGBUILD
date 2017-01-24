# Maintainer:  creeper123123321 <creeper123123321@gmail.com>
# Contributor:  creeper123123321 <creeper123123321@gmail.com>
pkgname=libparistraceroute-git
pkgver=v0.93.r12.gafbbcbe
pkgrel=1
pkgdesc="Paris traceroute is a new version of the well-known network diagnosis and measurement tool"
arch=('i686' 'x86_64')
makedepends=('git')
depends=('glibc')
provides=("${pkgname%-git}","paris-traceroute")
conflicts=("${pkgname%-git}","paris-traceroute")
license=('GPL')
source=("git+https://github.com/libparistraceroute/libparistraceroute.git")
url="https://github.com/libparistraceroute/libparistraceroute"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  make prefix=$pkgdir/usr install
  install -Dm644 man/paris-traceroute.1 $pkgdir/usr/share/man/man1/paris-traceroute.1
}
