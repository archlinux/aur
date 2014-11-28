# Contributor: Dragonlord <archlinux[at]dragonlord[.]cz>

pkgname=libghttp
pkgver=1.0.9
pkgrel=3
pkgdesc="HTTP protocol client library."
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
source=(ftp://ftp.gnome.org/pub/gnome/sources/$pkgname/1.0/$pkgname-$pkgver.tar.gz)
url="http://ftp.gnome.org/pub/gnome/sources/$pkgname/1.0"

md5sums=('0690e7456f9a15c635f240f3d6d5dab2')

build() {
  cd $startdir/src/$pkgname-$pkgver

  if [[ "$CARCH" == "x86_64" ]]; then
    ./configure --prefix=/usr --host=i686-pc-linux-gnu
  else
    ./configure --prefix=/usr
  fi

  make || return 1
  make prefix=$startdir/pkg/usr install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
