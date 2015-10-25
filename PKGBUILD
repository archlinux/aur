# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ngraph-gtk
pkgver=6.06.14
pkgrel=1
pkgdesc="A tool for creating scientific 2-dimensional graphs"
url="http://homepage3.nifty.com/slokar/ngraph/ngraph-gtk.html"
license=('GPL')
arch=('i686' 'x86_64')
depends=('desktop-file-utils' 'gsl' 'gtk3' 'ruby')
optdepends=('ttf-liberation: alternative to Times, Arial, and Courier')
_mirror="jaist" # "jaist" "iij" "osdn" "keihanna"
install=ngraph-gtk.install
source=("http://${_mirror}.dl.sourceforge.net/project/ngraph-gtk/${pkgver}/ngraph-gtk-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/ngraph-gtk-${pkgver}"
  
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/ngraph-gtk-${pkgver}"
  make DESTDIR="$pkgdir" install
  
  cd "${srcdir}/ngraph-gtk-${pkgver}/misc"
  install -Dm644 ngraph.desktop "${pkgdir}/usr/share/applications/ngraph.desktop"
  install -Dm644 ngraph.xml "${pkgdir}/usr/share/mime/packages/ngraph.xml"
  install -Dm644 ngraph.1 "${pkgdir}/usr/share/man/man1/ngraph.1"
  install -Dm644 ngp2.1 "${pkgdir}/usr/share/man/man1/ngp2.1"
}

md5sums=('6e55739e069cc26e8eb89d61bc2526d2')
