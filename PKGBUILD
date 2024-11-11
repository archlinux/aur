# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-gd
_project=gawkextlib
pkgver=1.0.3
pkgrel=4
pkgdesc="GAWK extension - interface to the GD graphics library"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL-3.0-or-later')
depends=('gawkextlib' 'gd' 'glibc')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz"
        api.patch)
md5sums=('08088809eb3a3f647aa5e92d1ac28ce0'
         '613d2bc25c8d72bc8339abe011b04bf6')
sha256sums=('059406fc0b72c38ca14f422136e3bd29e41ae8acd73440ddd8e743b83340b1ea'
            'cad0c6b8b9eb497229533678079b5f953447fdb7e31b77d0f491cf2ef28c8875')

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
