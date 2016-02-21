# $Id$ 
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=gpicview-gtk3
_pkgname=gpicview
pkgver=0.2.5
pkgrel=1
pkgdesc='Lightweight image viewer (GTK+ 3 version)'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
groups=('lxde-gtk3')
depends=('gtk3' 'desktop-file-utils')
makedepends=('intltool')
optdepends=('librsvg: For SVG support')
conflicts=($_pkgname)
install=$_pkgname.install
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz)
md5sums=('26be9b0c5a234f1afe7d83d02a4a33f4')

prepare() {
  cd $_pkgname-$pkgver

  # Apply only one main category (FS#34684)
  sed -i '/^Categories=/ s/Utility;//' gpicview.desktop.in
}

build() {
  cd $_pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr --enable-gtk3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
