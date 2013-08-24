# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

_pkgbasename=speex
pkgname=lib32-$_pkgbasename
pkgver=1.2rc1
pkgrel=4
pkgdesc="A free codec for free speech (32-bit)"
arch=(x86_64)
license=('BSD')
depends=('lib32-libogg' $_pkgbasename)
makedepends=(gcc-multilib)
options=('!libtool')
source=(http://downloads.us.xiph.org/releases/$_pkgbasename/$_pkgbasename-$pkgver.tar.gz)
md5sums=('c4438b22c08e5811ff10e2b06ee9b9ae')
url="http://www.speex.org/"

build() {
  cd $srcdir/speex-$pkgver

  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libdir=/usr/lib32
  make
}

package() {
  cd $srcdir/speex-$pkgver
  make DESTDIR=$pkgdir install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
