# Maintainer: yar cohen <yardenack@gmail.com>
# Contributor: jansvendsen <ardycef88f6@hg.basketrise.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>

gitname=libnbcompat
pkgname=${gitname}-git
epoch=1
pkgver=1.0.2.r0.g4700b022
pkgrel=1
pkgdesc='Portable NetBSD compatibility library'
arch=('x86_64')
url="https://github.com/archiecobbs/$gitname"
license=(BSD)
depends=(glibc)
provides=("$gitname=$epoch:$pkgver")
conflicts=("$gitname")
makedepends=(autoconf automake libtool)
source=("git+$url.git")
sha256sums=(SKIP)
pkgver() {
  cd "${srcdir}/${gitname}"
  git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cd "$srcdir/${gitname}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-db=true
  make
}
check() {
  cd "$srcdir/${gitname}"
  make check
}
package() {
  cd "$srcdir/${gitname}"
  make DESTDIR="$pkgdir" install
}
