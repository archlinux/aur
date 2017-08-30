pkgname=stacer
_gitname=Stacer
pkgver=1.0.8
pkgrel=1
pkgdesc="Ubuntu System Optimizer"
url="https://github.com/oguzhaninan/Stacer"
arch=('x86_64')
license=('MIT')
depends=('qt5-base' 'qt5-svg' 'qt5-charts')
makedepends=('qt5-tools')
source=("https://github.com/oguzhaninan/Stacer/archive/v${pkgver}.tar.gz" $pkgname.sh $pkgname.desktop)
sha256sums=('9071690e870aa8dc9a0a657ae4d42217e639189836a12bef39390acf49b6299d'
            '4bd04c3a0798453238ed834cab4a6b6a59c7f6f59d2d3ad663e61ab4e5dcd49e'
            '5b853a40cc986270bdf2ac3d6b5b42d0fe71a6373f4a382a313e71284c2037e8')

build() {
  cd "$srcdir/${_gitname}-${pkgver}"
  export QT_PLUGIN_PATH=plugins
  export LD_LIBRARY_PATH=lib
  qmake -spec linux-g++ "CONFIG += release" Stacer.pro && make
}

package() {
  cd "$srcdir/${_gitname}-${pkgver}"
  install -D stacer/stacer "$pkgdir/usr/bin/$pkgname"
  install -D stacer-core/libstacer-core.so.1 "$pkgdir/usr/lib/libstacer-core.so.1"
  install -D -m644 stacer.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D stacer/static/logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

