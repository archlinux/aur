# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ascii-design
pkgver=1.1.1
pkgrel=1
pkgdesc="A tool to create Ascii arts"
arch=('i686' 'x86_64')
url="http://ascii-design.sourceforge.net/"
license=('GPL2')
depends=('qt5-base' 'figlet' 'figlet-fonts')
makedepends=('make' 'cmake')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/Ascii-Design%20$pkgver/${pkgname}-$pkgver.tar.bz2")
sha1sums=('d5450875e5dab1ab6e1ad8d1da1b77894e282da0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -Dlibdir=/usr/lib \
        .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 COPYING.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
