# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Unknown47 <unknown47r@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=pcmanfm-gtk3
_pkgname=pcmanfm
pkgver=1.4.0
pkgrel=1
pkgdesc='Extremely fast and lightweight file manager (GTK+ 3 version)'
arch=('i686' 'x86_64')
url='http://pcmanfm.sourceforge.net/'
license=('GPL')
groups=('lxde-gtk3')
depends=('gtk3' 'desktop-file-utils' 'libfm-gtk3' 'lxmenu-data')
makedepends=('intltool')
optdepends=('gvfs: for trash support, mounting with udisks and remote filesystems'
            'udisks: alternative for mounting volumes'
            'xarchiver: archive management')
conflicts=($_pkgname)
install=$_pkgname.install
source=(git+https://github.com/lxde/pcmanfm.git#tag=${pkgver})
sha256sums=('ab7307df284ebc2a843a0aca85246bdde1187a57be3fc942d6e3b6e8517335b9')

prepare() {
  cd $_pkgname

  # Fix about dialog
  sed -i 's|<property name="has_separator">False</property>||g' data/ui/*

  autoreconf -fiv
}

build() {
  cd $_pkgname

  ./configure --sysconfdir=/etc --prefix=/usr --with-gtk=3
  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install
}
