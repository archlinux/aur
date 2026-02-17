# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=gperiodic
pkgver=3.0.3
pkgrel=1
pkgdesc="A small GTK+-based program which allows you to browse through a periodic table of chemical elements."
arch=('i686' 'x86_64' 'aarch64')
url="https://sourceforge.net/projects/${pkgname}"
license=('GPL-2.0-or-later')
#depends=('gtk2' 'glib2' 'cairo' 'pango' 'harfbuzz' 'freetype2' 'fontconfig' 'hicolor-icon-theme')
depends=('gtk2' 'hicolor-icon-theme')
makedepends=('intltool')
source=("${pkgname}-${pkgver}.tar.gz::${url}/files/${pkgname}-${pkgver}.tar.gz/download")
sha256sums=('5e70128f61a311bd6b4ad129bd726ccc0e3731573cb0050201293e2a5389b29a')

prepare() {
  #Fix for line 140 of file gperiodic.c, since it contains a type error 
  #(needs to type-cast a GtkWidget variable called 'label' into GTK_LABEL first):
  sed -i '140 s/.*/gtk_label_set_selectable (GTK_LABEL (label), TRUE);/' "$srcdir/$pkgname-$pkgver/gperiodic.c"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"  
  make all

}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
}
