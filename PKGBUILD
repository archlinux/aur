# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libghttp
pkgver=1.0.9
pkgrel=3
pkgdesc="HTTP protocol client library"
arch=('i686' 'x86_64')
url="http://ftp.gnome.org/pub/gnome/sources/$pkgname/1.0"
license=('GPL')
source=(ftp://ftp.gnome.org/pub/gnome/sources/$pkgname/1.0/$pkgname-$pkgver.tar.gz)
md5sums=('0690e7456f9a15c635f240f3d6d5dab2')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

   if [[ "$CARCH" == "x86_64" ]]; then
     ./configure --prefix=/usr --host=i686-pc-linux-gnu
   else
     ./configure --prefix=/usr
   fi
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make prefix="${pkgdir}"/usr install
  find "${pkgdir}" -name '*.la' -exec rm {} \;
}
