# Maintainer: Clarence <xjh.azzbcc@gmail.com>
_pkgname=spandsp
pkgname=${_pkgname}-fs
pkgver=3.0.0.ge59ca8f
pkgrel=1
pkgdesc="A DSP library for telephony (FreeSWITCH version)"
arch=('x86_64')
depends=('libtiff')
provides=('spandsp')
conflicts=('spandsp')
url="https://github.com/freeswitch/spandsp"
license=('LGPL' 'GPL')
source=("git+https://github.com/freeswitch/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s.g%s" `awk '/^Version:/ { print $2 }' spandsp.spec` `git describe --always`
}

build() {
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make -C src
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" -C src install
  make DESTDIR="$pkgdir" install-pkgconfigDATA
}

