# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=obconf
pkgver=2.0.4
pkgrel=8
pkgdesc="A GTK+ based configuration tool for the Openbox windowmanager"
arch=('x86_64')
url="http://openbox.org/wiki/ObConf:About"
license=('GPL')
depends=('openbox' 'gtk3' 'libobrender.so')
source=("http://openbox.org/dist/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc}
        stop-using-libglade.patch
        switch-to-gtk3.patch)
md5sums=('9271c5d2dc366d61f73665a5e8bceabc'
         'SKIP'
         '6be2148229280c3ba961f7aad928bc27'
         'fb2c56d8e62bfbadd6ed6a735b0e10c2')
sha256sums=('71a3e5f4ee246a27421ba85044f09d449f8de22680944ece9c471cd46a9356b9'
            'SKIP'
            '2b1fcb0ca2b85b90a45fc667d061852172aa9f27a35b263ecc9a7ffcc8c5b026'
            'f1bcd1720e35ef2c8b9f8ad0a202a150d9affe116779d3ceb9b569a0ed32b010')
validpgpkeys=(1FEECBB03AB7D3216B5E0AC9274E52855D203EC3)

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # Stop using libglade, and switch to GTK+ 3
  patch -Np1 -i "${srcdir}"/stop-using-libglade.patch
  patch -Np1 -i "${srcdir}"/switch-to-gtk3.patch
  autoreconf -fi
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  #./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
