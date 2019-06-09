# Maintainer: Alexandre Moine < nobrakal at cthugha dot org >
# Contributor: Tasos Latsas < tlatsas2000 at gmail dot com >

pkgname=t4kcommon
pkgver=0.1.1
pkgrel=3
pkgdesc="Common library for code shared by TuxType and TuxMath"
arch=('i686' 'x86_64')
url="http://tux4kids.alioth.debian.org/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_pango' 'sdl_net' 'librsvg')
makedepends=('make')
options=('!docs')
replace=('t4k_common')
source=("https://github.com/tux4kids/$pkgname/archive/upstream/${pkgver}.tar.gz"
        "libpng15.patch"
	https://sources.debian.org/data/main/t/t4kcommon/0.1.1-6/debian/patches/916060_bugfix.patch)
sha256sums=('be4cadbcf2728ed6efb1c71e96c209184a7829b65af3625d9410a29fb2fd775a'
            '9a778a6bbe6f1c95b5ad1418a35bb41dbdbe3afb6520745eb9bd34dfa7a27dbf'
            '1d5bb9a9cf809f26508e4611fb564e050b554036a679ec28b79827785a3f46c8')

prepare() {
  cd "$srcdir/$pkgname-upstream-$pkgver"
  patch -Np2 -i "${srcdir}/libpng15.patch"
  patch -Np1 -i "${srcdir}/916060_bugfix.patch"
}

build() {
  cd "$srcdir/$pkgname-upstream-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-upstream-$pkgver"

  make DESTDIR=$pkgdir install
}
