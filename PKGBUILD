# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=python2-xcb-proto
pkgver=1.14
pkgrel=1
pkgdesc="XML-XCB protocol descriptions. (Python2)"
arch=(any)
url='https://xcb.freedesktop.org'
license=('custom')
depends=('xcb-proto')
makedepends=('python2'
             'libxml2'
             )
source=(https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-$pkgver.tar.xz{,.sig})
sha512sums=('de66d568163b6da2be9d6c59984f3afa3acd119a781378638045fd68018665ef5c9af98f024e9962ba3eb7c7a4d85c27ba70ffafceb2324ccc6940f34de16690'
            'SKIP')
validpgpkeys=('A66D805F7C9329B4C5D82767CCC4F07FAC641EFF') # "Daniel Stone <daniels@collabora.com>"
validpgpkeys+=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"

build() {
  cd xcb-proto-$pkgver
  PYTHON=python2 ./configure --prefix=/usr
  make
}

check() {
  cd xcb-proto-$pkgver
  PYTHON=python2 make -k check || /bin/true
}

package() {
  cd xcb-proto-$pkgver
  PYTHON=python2 make DESTDIR="$pkgdir" install
  rm -fr "$pkgdir/usr/lib/pkgconfig"
  rm -fr "$pkgdir/usr/share/xcb"
  install -m755 -d "$pkgdir/usr/share/licenses/python2-xcb-proto"
  install -m644 COPYING "$pkgdir/usr/share/licenses/python2-xcb-proto"
}
