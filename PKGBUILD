# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.147
pkgrel=1
pkgdesc='A powerful Newsgroup Article reader'
arch=(x86_64)
url='http://pan.rebelbase.com/'
license=(GPL2)
depends=(gtkspell3 gmime)
makedepends=(intltool itstool)
source=(https://gitlab.gnome.org/GNOME/pan/-/archive/PAN_${pkgver/./_}/pan-PAN_${pkgver/./_}.tar.gz)
sha256sums=('30f60d6eae4b578a4ec1530ed265f0d2aefd256e618ce1714e21f642340085e0')

prepare() {
  cd pan-PAN_${pkgver/./_}
  sed -e 's/enchant/enchant-2/g' -i configure.ac
  sed -e 's|enchant/enchant.h|enchant-2/enchant.h|' -i pan/gui/group-prefs-dialog.cc
  sed -e '/AM_PATH_GTK_2_0/d' -i configure.ac
  ./autogen.sh
}

build() {
  cd pan-PAN_${pkgver/./_}
  ./configure --prefix=/usr --with-gnutls --with-gtk3
  make
}

package() {
  cd pan-PAN_${pkgver/./_}
  make DESTDIR="$pkgdir" install
}
