# Maintainer: Thomas Bächler <thomas@archlinux.org>
pkgname=nspluginwrapper
pkgver=1.4.0
pkgrel=2
pkgdesc="Cross-platform NPAPI compatible plugin viewer"
arch=('x86_64')
url="http://nspluginwrapper.davidben.net/"
license=('GPL')
depends=('curl' 'lib32-libxt' 'lib32-gcc-libs' 'gtk2' 'lib32-gtk2')
makedepends=('gcc-multilib')
install="install"
source=(http://web.mit.edu/davidben/Public/$pkgname/$pkgname-$pkgver.tar.gz
        nspluginwrapper-native-windows.patch)
sha256sums=('39b9034dc840ac6a21701406d96449e578b787aad7f6a09d97113776cf8251b3'
            '3796b66f53448f4668e70aec97a3d74db2b2fcd308b36f87373405547cae38b1')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Patch taken from the openSuSE src.rpm
  patch -p0 -i "$srcdir/nspluginwrapper-native-windows.patch"

  ./configure --with-lib32=lib32 --with-lib64=lib
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make -j1 DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
