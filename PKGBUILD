pkgname=binfmt-support
pkgver=2.1.8
pkgrel=2
pkgdesc="register interpreters for various binary formats"
arch=('i686' 'x86_64')
url="https://packages.debian.org/en/sid/binfmt-support"
license=('GPL')
depends=('libpipeline')
options=('emptydirs')
source=("http://http.debian.net/debian/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('ebad04db8444d2275d042b5074fa3e160bcf3e2c23ee9b660e75f5acd73618a2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --disable-upstart
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
