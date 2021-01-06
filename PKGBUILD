# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ngraph-gtk
pkgver=6.08.09
pkgrel=1
pkgdesc="A tool for creating scientific 2-dimensional graphs"
url="http://hito.music.coocan.jp/ngraph/ngraph-gtk.html"
license=('GPL')
arch=('x86_64')
depends=('gsl' 'gtk3' 'gtksourceview3' 'ruby')
optdepends=('ttf-liberation: alternative to Times, Arial, and Courier')
source=("https://github.com/htrb/ngraph-gtk/releases/download/v${pkgver}/ngraph-gtk-${pkgver}.tar.gz")
options=('!makeflags')
sha512sums=('a6be6e35cc806970b61271f5acd4988cf1cd394881b50255daed9205e4968165419e844adf5f202385fff3f922da12789f86fdded6489d53868e3bc2a7f984a2')

build() {
  cd "${srcdir}/ngraph-gtk-${pkgver}"
  
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/ngraph-gtk-${pkgver}"
  make DESTDIR="$pkgdir" install
  
  cd "${srcdir}/ngraph-gtk-${pkgver}/misc"
  install -Dm644 com.github.htrb.ngraph-gtk.desktop "${pkgdir}/usr/share/applications/ngraph.desktop"
  install -Dm644 com.github.htrb.ngraph-gtk.metainfo.xml "${pkgdir}/usr/share/mime/packages/ngraph.xml"
  install -Dm644 ngraph.keys "${pkgdir}/usr/share/mime-info/ngraph.keys"
  install -Dm644 ngraph.mime "${pkgdir}/usr/share/mime-info/ngraph.mime"
  install -Dm644 ngraph.1 "${pkgdir}/usr/share/man/man1/ngraph.1"
  install -Dm644 ngp2.1 "${pkgdir}/usr/share/man/man1/ngp2.1"
  install -Dm644 ngraph.bash "${pkgdir}/usr/share/bash-completion/completions/ngraph"
  install -Dm644 ngraph.applications "${pkgdir}/usr/share/application-registry/ngraph.applications"
}

