#$Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=lxappearance-gtk3
_pkgname=lxappearance
pkgver=0.6.1
pkgrel=1
pkgdesc='Feature-rich GTK+ theme switcher of the LXDE Desktop (GTK+ 3 version)'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
groups=('lxde-gtk3')
depends=('gtk3')
makedepends=('intltool' 'dbus-glib')
conflicts=($_pkgname)
provides=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz
        0001-Substitute-the-correct-GTK-version-in-pkgconfig-file.patch
        0002-Fix-About-dialog-for-GTK-3.patch)
md5sums=('79740125628a8374c1101cf26e558fa5'
         '4c8e294c268c884e92e7b2b87c3f0942'
         'ca89c010d12ca4be9120580334bcda79')

prepare() {
  cd $_pkgname-$pkgver

  # Substitute the correct GTK+ version in pkgconfig file
  patch -Np1 -i ../0001-Substitute-the-correct-GTK-version-in-pkgconfig-file.patch

  # Fix About dialog for GTK+ 3
  patch -Np1 -i ../0002-Fix-About-dialog-for-GTK-3.patch

  autoreconf -fi
}

build() {
  cd $_pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr \
    --enable-dbus --enable-gtk3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
