# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: "Amhairghin" Oscar Garcia Amor
# Contributors: bhushan, huma, adlaiff6, Invie, solarce

pkgname=tmate-git
pkgver=2.4.0.r29.gac919516
pkgrel=1
pkgdesc="Instant terminal sharing"
arch=('x86_64')
url="https://tmate.io/"
license=('ISC')
depends=('libevent' 'libssh' 'libutempter' 'msgpack-c' 'ncurses')
makedepends=('git')
source=("git+https://github.com/tmate-io/tmate.git")
sha256sums=('SKIP')

pkgver() {
  cd tmate
  git describe --tags | sed 's/-/.r/;s/-/./g'
}

prepare() {
  cd tmate
  ./autogen.sh
  autoupdate
}

build() {
  cd tmate
  ./configure --prefix=/usr
  make
}

package() {
  cd tmate
  make DESTDIR="${pkgdir}" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" COPYING
}

# vim: set ts=2 sw=2 et:
