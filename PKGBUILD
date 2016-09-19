# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Caleb Jacobs <caleb.jacobs@gmail.com>
pkgname=matwm2
pkgver=0.1.2pre3
pkgrel=2
pkgdesc="A nice tiling or floating window manager"
arch=('i686' 'x86_64')
url="https://github.com/segin/${pkgname}"
license=('MIT')
depends=('libxinerama' 'libxft')
source=("https://github.com/segin/${pkgname}/archive/${pkgver}.tar.gz"
	$pkgname.desktop)
md5sums=('785ad4210793987860d1eca885de8db2'
         '8b9993b93fe1d5337b631165db7252c9')

build() {
  cd $pkgname-$pkgver/${pkgname}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname-$pkgver/${pkgname}
  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/xsessions/$pkgname.desktop"
}
