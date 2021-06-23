# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ngraph-gtk
pkgver=6.09.03
pkgrel=1
pkgdesc="A tool for creating scientific 2-dimensional graphs"
url="https://github.com/htrb/ngraph-gtk/"
license=('GPL')
arch=('x86_64')
depends=('gsl' 'gtksourceview4' 'ruby')
optdepends=('ttf-liberation: alternative to Times, Arial, and Courier')
source=("https://github.com/htrb/ngraph-gtk/releases/download/v${pkgver}/ngraph-gtk-${pkgver}.tar.gz")
options=('!makeflags')
sha512sums=('917360dad726bf117478cd4c8414c4da2efd3df3aa4ef4ae52b02282c9c25abeff524d93a8e8e9918de89653e7651411c6e2f96c762751e8a3e83f73f50cc00a')

build() {
  cd "${srcdir}/ngraph-gtk-${pkgver}"
  
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/ngraph-gtk-${pkgver}"
  make DESTDIR="$pkgdir" install
  
  cd "${srcdir}/ngraph-gtk-${pkgver}/misc"
  install -Dm644 com.github.htrb.ngraph-gtk.desktop "${pkgdir}/usr/share/applications/com.github.htrb.ngraph-gtk.desktop"
  # install -Dm644 com.github.htrb.ngraph-gtk.metainfo.xml "${pkgdir}/usr/share/mime/packages/com.github.htrb.ngraph-gtk.metainfo.xml"
  install -Dm644 ngraph.keys "${pkgdir}/usr/share/mime-info/ngraph.keys"
  install -Dm644 ngraph.mime "${pkgdir}/usr/share/mime-info/ngraph.mime"
  install -Dm644 ngraph.1 "${pkgdir}/usr/share/man/man1/ngraph.1"
  install -Dm644 ngp2.1 "${pkgdir}/usr/share/man/man1/ngp2.1"
  install -Dm644 ngraph.bash "${pkgdir}/usr/share/bash-completion/completions/ngraph"
  install -Dm644 ngraph.applications "${pkgdir}/usr/share/application-registry/ngraph.applications"
}

