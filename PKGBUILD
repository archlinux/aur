# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ngraph-gtk
pkgver=6.09.05
pkgrel=1
pkgdesc="A tool for creating scientific 2-dimensional graphs"
url="https://github.com/htrb/ngraph-gtk/"
license=('GPL')
arch=('x86_64')
depends=('gsl' 'gtksourceview4' 'ruby')
optdepends=('ttf-liberation: alternative to Times, Arial, and Courier')
source=("https://github.com/htrb/ngraph-gtk/releases/download/v${pkgver}/ngraph-gtk-${pkgver}.tar.gz")
options=('!makeflags')
sha512sums=('0ffb57c0a743ac6a15427b48027f1f90042c598af962bb168eb61af157bc75657b53c79878babc14cacd210a13237b6c3bf127dee71a5c4448420c67bf4540e4')

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

