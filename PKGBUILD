# Maintainer: HRKo <hrko[at]r-c.dev>
pkgname=libarib25
pkgver=0.2.5_20190204
pkgrel=1
pkgdesc='ARIB STD-B25 library for Linux.'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/stz2012/libarib25'
license=('Apache')
makedepends=('git' 'cmake')
depends=('pcsclite')
provides=('libarib25')
conflicts=('libarib25-git')
source=("https://github.com/stz2012/libarib25/archive/v${pkgver//_/-}.tar.gz")
md5sums=('7aef479af038a72d51e838b46ddfb6b1')

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}/cmake"

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}/cmake"

  make install DESTDIR=$pkgdir
  if test -e $pkgdir/usr/lib64; then
    mv $pkgdir/usr/lib64 $pkgdir/usr/lib
  fi
}
