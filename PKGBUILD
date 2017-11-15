# Maintainer: Thomas Bächler <thomas@archlinux.org>
pkgname=nspluginwrapper
pkgver=1.4.4
pkgrel=3
pkgdesc="Cross-platform NPAPI compatible plugin viewer"
arch=('x86_64')
url="http://nspluginwrapper.davidben.net/"
license=('GPL')
depends=('curl' 'libxt' 'gcc-libs' 'gtk2')
depends_x86_64=('lib32-libxt' 'lib32-gcc-libs' 'lib32-gtk2')
makedepends_x86_64=('gcc-multilib')
install="install"
source=(http://nspluginwrapper.davidben.net/download/$pkgname-$pkgver.tar.gz
        'fix_missing_lib.patch')
md5sums=('36f3e290fc4ce56f65ee695078961188'
         '00ca2d1ab0d7348e3157cb7b72f30e1a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i "$srcdir/fix_missing_lib.patch"

  configure_args=""
  if [[ $CARCH == x86_64 ]]; then
    configure_args="$configure_args --with-lib32=lib32 --with-lib64=lib"
  fi

  ./configure $configure_args
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make -j1 DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
