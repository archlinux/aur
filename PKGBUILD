# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-gd
_project=gawkextlib
pkgver=1.0.3
pkgrel=2
pkgdesc="GAWK extension - interface to the GD graphics library"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL-3.0-or-later')
depends=('gawkextlib' 'gd' 'glibc')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz"
        api.patch)
md5sums=('08088809eb3a3f647aa5e92d1ac28ce0'
         '45a7c4bd233299ebc128d24a462520a3')
sha256sums=('059406fc0b72c38ca14f422136e3bd29e41ae8acd73440ddd8e743b83340b1ea'
            '8f6394d649f2844ccc96081485d10fb3baff3a683b333116217f45c121da2f79')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir"/api.patch
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-silent-rules
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
