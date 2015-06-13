# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-themes-extras
pkgver=2.22.0
pkgrel=3
pkgdesc='Extra themes for GNOME2'
arch=('any')
license=('GPL')
depends=('gtk-engines>=2.18.4' 'librsvg>=2.26.0')
makedepends=('intltool' 'icon-naming-utils')
url='http://www.gnome.org'
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2"
        'darklooks-gtkrc.patch')
md5sums=('3c24a31bf43d4dbb97bc8712b8cd72b3'
         'a6a32d2f8f978831064723ddf9c80ab5')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/darklooks-gtkrc.patch"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
  --localstatedir=/var
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
