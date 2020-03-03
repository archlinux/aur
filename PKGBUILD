# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

# Make sure that your user is in the group 'uucp'.
#
# Kermit might need a different lock directory because of the permissions. Try
# to run hptalx as:
#   $ LOCK_DIR=/tmp hptalx

pkgname=hptalx
pkgver=1.3.1a
pkgrel=1
pkgdesc="A HP Calculator<->PC communications program for Linux"
arch=('i686' 'x86_64')
url="http://hptalx.sourceforge.net/"
license=('GPL')
depends=('ckermit' 'glib2' 'gtk2' 'libxml2')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
        0001_list_store.patch
        0002_spinbutton.patch
        0003_k_wait_ready.patch
        0004_kermit_missing_info.patch
        0005_arch_kermit_name.patch)
sha256sums=('d725d2b5806ab9f70432c6adcc6db41c3cc94b5444b90e52878a395dd115af60'
            '5d687b7eef67d48652a82e575e8a3f988d4dc9b1138be0140c72cfa9b7ee688a'
            'e9c6860531a257910c3da5cfbdcc0a391851c314896d5ae29db1471d08ded2af'
            '09b4c2b4fb3a5391f2b77e4d2d17c49c2f5663e3124f2fd3eeb0abb58caf2d48'
            '9ce7cea5882d44a242b7a04fc9ef6e95c76d1664fd6475850991b2f655d7fad8'
            'f8bc335150d6069b5e7bb0cc070585f1065e75b9c9e2bc3edf7dde4833ae0504')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i ../0001_list_store.patch
  patch -p1 -i ../0002_spinbutton.patch
  patch -p1 -i ../0003_k_wait_ready.patch
  patch -p1 -i ../0004_kermit_missing_info.patch
  patch -p1 -i ../0005_arch_kermit_name.patch

}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
