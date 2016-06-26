# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ascii-design
pkgver=1.1.1
pkgrel=2
pkgdesc="A tool to create Ascii arts"
arch=('i686' 'x86_64')
url="http://ascii-design.sourceforge.net/"
license=('GPL2')
depends=('qt5-base' 'figlet' 'figlet-fonts')
makedepends=('make' 'cmake')
#source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/Ascii-Design%20$pkgver/${pkgname}-$pkgver.tar.bz2")
source=("https://github.com/Faster3ck/Ascii-Design/archive/v${pkgver}.tar.gz")
sha1sums=('ebe9a3492a9082c7417a06d70a3727951b017b97')

build() {
  cd "$srcdir/Ascii-Design-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -Dlibdir=/usr/lib \
        .
  make
}

package() {
  cd "$srcdir/Ascii-Design-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 COPYING.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
