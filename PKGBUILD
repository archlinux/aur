# Maintainer: Logan Sevcik <logan+aur@sevcik.email>
pkgname=nqptp-git
pkgver=1.1.dev.r120.g4df1dee
pkgrel=1
pkgdesc="A daemon that monitors timing data from PTP clocks"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mikebrady/nqptp#readme"
license=('GPL2')
provides=(nqptp)
conflicts=(nqptp)
replaces=(nqptp)
backup=()
options=()
source=("git+https://github.com/mikebrady/nqptp.git")
noextract=()
md5sums=('SKIP')

_gitname="nqptp"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  autoreconf -fi
  ./configure --prefix=/usr --with-systemd-startup
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
