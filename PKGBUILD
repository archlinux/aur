# Maintainer: Thomas Bächler <thomas@archlinux.org>
pkgname=nspluginwrapper
pkgver=1.3.0
pkgrel=1
pkgdesc="Cross-platform NPAPI compatible plugin viewer"
arch=('x86_64')
url="http://freshmeat.net/projects/nspluginwrapper/"
license=('GPL')
depends=('curl' 'lib32-libxt' 'gcc-libs-multilib' 'gtk2' 'lib32-gtk2')
makedepends=('gcc-multilib')
source=(ftp://ftp.archlinux.org/other/nspluginwrapper/$pkgname-$pkgver.tar.gz
        npw-viewer.c.patch)
sha256sums=('0af7e2ae4c6258d5c17addbcc4658b84c979860da843873f0d15d90ee9a8259d'
            '4b216cca327ae76e6e2ab6dc6bbaf3efe1123c63a09b0e7e45c964531fcbdeb0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i "$srcdir/npw-viewer.c.patch"
  ./configure --with-lib32=lib32 --with-lib64=lib
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make -j1 DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir"/usr/lib/mozilla/plugins/
  ln -s /usr/lib/nspluginwrapper/x86_64/linux/npwrapper.so "$pkgdir"/usr/lib/mozilla/plugins/
}

# vim:set ts=2 sw=2 et:
