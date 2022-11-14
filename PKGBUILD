# Maintainer: Thomas Bächler <thomas@archlinux.org>
pkgname=nspluginwrapper
pkgver=1.4.4
pkgrel=6
pkgdesc="Cross-platform NPAPI compatible plugin viewer"
arch=('x86_64')
url="http://nspluginwrapper.davidben.net/"
license=('GPL')
depends=('curl' 'libxt' 'gcc-libs' 'gtk2')
depends_x86_64=('lib32-libxt' 'lib32-gcc-libs' 'lib32-gtk2')
install="install"
#source=(http://nspluginwrapper.davidben.net/download/$pkgname-$pkgver.tar.gz
source=("https://github.com/davidben/nspluginwrapper/archive/nspluginwrapper-$pkgver.tar.gz"
        'fix_missing_lib.patch' nspluginwrapper-redef.patch)
md5sums=('f00fbc0cea8c962dfc0de2f11e2ab548'
         '00ca2d1ab0d7348e3157cb7b72f30e1a'
         'd42696fb591d278b1b56002e547f7740')
sha256sums=('d82cadc076b0d83a192ffed2100138c620f5830e01c96c37ef7e4c54895775a3'
            '2630d9d8826ac19c1273b645bfe122e751076f9f0e6fd1d8495768ac10dee5e2'
            'e5744fa6d4a7d2f6414eca6c5f5846321005e60cd4e4fa43ebdc98974c5a44c7')

prepare() {
  cd $pkgname-$pkgname-$pkgver

  patch -p1 -i "$srcdir/fix_missing_lib.patch"
  patch -p1 -i ../nspluginwrapper-redef.patch # Fix redefinitions
}

build() {
  cd $pkgname-$pkgname-$pkgver
  configure_args=""
  if [[ $CARCH == x86_64 ]]; then
    configure_args="$configure_args --with-lib32=lib32 --with-lib64=lib"
  fi

  ./configure $configure_args
  make -j1
}

package() {
  cd $pkgname-$pkgname-$pkgver

  make -j1 DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
