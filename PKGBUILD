# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=webkit-sharp
pkgver=0.3
pkgrel=6
pkgdesc="Mono/.NET bindings for the WebKit rendering engine for GTK 2."
arch=('i686' 'x86_64')
url="http://www.mono-project.com/"
license=('MIT')
depends=('gtk-sharp-2' 'webkitgtk2')
source=("https://github.com/mono/webkit-sharp/archive/0.3.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i "s|webkit-1.0@LIB_PREFIX@.2@LIB_SUFFIX@|libwebkitgtk-1.0.so.0|g" sources/webkit-sharp.dll.config.in
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh --prefix=/usr
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
