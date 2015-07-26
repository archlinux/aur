# Contributor: Julian Leyh <julian@vgai.de>
# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=ahven
pkgver=2.4
pkgrel=1
pkgdesc="Ahven is a simple unit test framework for the Ada programming language."

arch=('i686' 'x86_64')
url="http://ahven.stronglytyped.org/"
license=('BSD')

depends=('gcc-ada')
makedepends=('sphinxcontrib-adadomain')


source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/Ahven%20$pkgver/$pkgname-$pkgver.tar.gz
        ahven-text_runner.adb-patch
        ahven-runner.adb-patch)

md5sums=('f0113f49e36f9f2b33e3682bbfd87e28'
         '57f341908ec1d8235051cd59b30e4a71'
         '6d8e78c3757a220f4f8575a4a836e949')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p0 -i ../ahven-text_runner.adb-patch
  patch -p0 -i ../ahven-runner.adb-patch

  make
}


check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" SPHINXBUILD=sphinx-build2 install
}
