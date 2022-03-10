pkgname=verdict
pkgver=1.4.0
pkgrel=1
pkgdesc="Compute quality functions of 2 and 3-dimensional regions"
arch=('x86_64')
url="https://github.com/sandialabs/verdict"
license=('BSD')
makedepends=('cmake')
depends=('glibc')
source=("https://github.com/sandialabs/verdict/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('40efa47bced00df650cead5f1525695bb751eaf9145f136177d6c8a718847481')

build() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DVERDICT_ENABLE_TESTING=OFF -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package ()
{
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
