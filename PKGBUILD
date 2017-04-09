# Maintainer: piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=etl-git
pkgver=r8165.bd7d8b2cc
pkgrel=1
pkgdesc="VoriaETL: C++ STL complementory multiplatform template library"
arch=(any)
url="http://synfig.org"
license=('GPL2')
depends=()
conflicts=('synfig-etl' 'etl')
replaces=('synfig-etl')
provides=('etl')
source=(git+https://github.com/synfig/synfig)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/synfig/ETL
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/synfig/ETL
  autoreconf -fi
}

build() {
  cd "$srcdir"/synfig/ETL
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/synfig/ETL
  make DESTDIR="$pkgdir" install
}
