# $Id$ 
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=gpicview-gtk3
_pkgname=gpicview
pkgver=0.2.4
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
provides=($_pkgname)
install=$_pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/lxde/$_pkgname-$pkgver.tar.gz
        0001-Remove-Utility-from-desktop-categories.patch
        0002-Beautify-GtkBuilder-UI-file-without-modification.patch
        0003-Some-fixes-for-GTK-3.patch)
md5sums=('b209e36531f89c48e3067b389699d4c7'
         'aa9950bccb95ff4bffd7e44c7e8750ec'
         'd5e57f50c0831c4e014cd1d7247f941b'
         '9ed0daa0f6f2d74ae67c5a437b77e501')

prepare() {
  cd $_pkgname-$pkgver

  # Remove 'Utility' from desktop categories
  patch -Np1 -i ../0001-Remove-Utility-from-desktop-categories.patch

  # Some fixes for GTK+ 3
  patch -Np1 -i ../0002-Beautify-GtkBuilder-UI-file-without-modification.patch
  patch -Np1 -i ../0003-Some-fixes-for-GTK-3.patch
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
