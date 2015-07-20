# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Filipp "Scorp" Andjelo <scorp@mailueberfall.de>

pkgname=lxinput-gtk3
_pkgname=lxinput
pkgver=0.3.4
pkgrel=1
pkgdesc="Small program to configure keyboard and mouse for LXDE (GTK+ 3 version)"
arch=('i686' 'x86_64')
url="http://lxde.org/"
license=('GPL')
groups=('lxde-gtk3')
depends=('gtk3')
makedepends=('intltool')
conflicts=($_pkgname)
provides=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz
        0001-Fix-GtkBuilder-UI-file-for-GTK-3-add-mouse-icon-to-m.patch)
sha256sums=('6e37074e406a05792f6eaac029638bd02fe88926f20736d73dcb5113da825c24'
            'ee431435f8c0e09e3c25bca89fc8325b0910318d210cd629c2778ceaea8f0518')

prepare() {
  cd $_pkgname-$pkgver

  # Fix GtkBuilder UI file for GTK+ 3, add mouse icon to mouse
  patch -Np1 -i ../0001-Fix-GtkBuilder-UI-file-for-GTK-3-add-mouse-icon-to-m.patch
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

