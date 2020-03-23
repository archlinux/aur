# Maintainer:
# PKGBUILD adaptation for openbox_eui: Alexey Korop <akorop@ukr.net>

# Base package
Pkgname=obconf

# Package for  oprnbox_eui. Need rebuilding due to another libobrender.so
pkgname="$Pkgname"_eui

pkgver=2.0.4
pkgrel=6
pkgdesc="A GTK+ based configuration tool for the Openbox_eui windowmanager"
arch=('x86_64')
url="http://openbox.org/wiki/ObConf:About"
license=('GPL')
depends=('openbox_eui' 'libglade' 'libobrender.so')
makedepends=('openbox_eui')
conflicts=('obconf')
provides=('obconf')
source=("http://openbox.org/dist/$Pkgname/$Pkgname-$pkgver.tar.gz"{,.asc})
md5sums=('9271c5d2dc366d61f73665a5e8bceabc'
         'SKIP')
validpgpkeys=(1FEECBB03AB7D3216B5E0AC9274E52855D203EC3)

prepare() {
  cd "${srcdir}"/${Pkgname}-${pkgver}
  autoreconf -fi
}

build() {
  cd "${srcdir}"/${Pkgname}-${pkgver}

  #./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${Pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
