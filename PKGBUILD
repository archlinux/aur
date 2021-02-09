# Maintainer: VanLaser <gabi_laser at yahoo dot com>

pkgname='eql5-git'
pkgver=r301.69a094b
pkgrel=1
pkgdesc='Embedded Qt Lisp (Qt5 binding embedded in ECL, embeddable in Qt)'
arch=('x86_64')
url='https://gitlab.com/eql/EQL5'
license=('MIT')
depends=('ecl'
         'qt5-base'
         'qt5-tools'
         'qt5-multimedia'
         'qt5-quickcontrols2'
         'qt5-svg'
         'qt5-webengine')
makedepends=('git'
             'qt5-tools')
conflicts=('eql5')
provides=('eql5')             
source=('git+https://gitlab.com/eql/EQL5')
sha256sums=('SKIP')

pkgver() {
         cd EQL5
         printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
          cd EQL5/src/
}

build() {
        cd EQL5/src/
        ecl -shell make.lisp
        qmake eql5.pro
        make
}

package() {
          cd EQL5/src/
          make INSTALL_ROOT="$pkgdir/" install
	  cd $srcdir/EQL5
	  install -Dm644 LICENSE-1.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	  install -Dm644 LICENSE-2-MAKE-QIMAGE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MAKE_QIMAGE"
}
