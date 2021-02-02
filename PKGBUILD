# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ngraph-gtk
pkgver=6.09.01
pkgrel=1
pkgdesc="A tool for creating scientific 2-dimensional graphs"
url="https://github.com/htrb/ngraph-gtk/"
license=('GPL')
arch=('x86_64')
depends=('gsl' 'gtk3' 'gtksourceview3' 'ruby')
optdepends=('ttf-liberation: alternative to Times, Arial, and Courier')
source=("https://github.com/htrb/ngraph-gtk/releases/download/v${pkgver}/ngraph-gtk-${pkgver}.tar.gz")
options=('!makeflags')
sha512sums=('de0141d91a80802d1b83e93d7ea8d25f78d65666a0ca81c23967b0bf380be974fa4c0fa16561b934739e3249317f6f64bf9af5b344db317ce5eb0ae705d5df7c')

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

