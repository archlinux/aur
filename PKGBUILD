# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ngraph-gtk
pkgver=6.07.01
pkgrel=1
pkgdesc="A tool for creating scientific 2-dimensional graphs"
url="https://github.com/htrb/ngraph-gtk"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gsl' 'gtk3' 'ruby')
optdepends=('ttf-liberation: alternative to Times, Arial, and Courier')
source=("https://github.com/htrb/ngraph-gtk/releases/download/v${pkgver}/ngraph-gtk-${pkgver}.tar.gz")
options=('!makeflags')

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

md5sums=('e647fed409d95e454ba844b1b4aee97d')
