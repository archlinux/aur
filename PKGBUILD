# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnetfilter_cthelper-git
pkgver=1.0.1.r3.g9ddbb7d
pkgrel=1
pkgdesc="Library that provides access to the user-space helper infrastructure"
arch=('i686' 'x86_64')
url="https://netfilter.org/projects/libnetfilter_cthelper/index.html"
license=('GPL-2.0-or-later')
depends=('libmnl')
makedepends=('git')
provides=("libnetfilter_cthelper=$pkgver")
conflicts=('libnetfilter_cthelper')
source=("git+https://git.netfilter.org/libnetfilter_cthelper")
sha256sums=('SKIP')


pkgver() {
  cd "libnetfilter_cthelper"

  git describe --long --tags | sed 's/^libnetfilter_cthelper-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libnetfilter_cthelper"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "libnetfilter_cthelper"

  make DESTDIR="$pkgdir" install
}
