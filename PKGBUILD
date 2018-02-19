# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sven Kauber <celeon@gmail.com>

pkgname=bbrun
pkgver=1.6
pkgrel=6
pkgdesc="A run - component for blackbox window manager"
arch=('x86_64' 'i686')
#url="http://www.darkops.net/bbrun/"
url="https://packages.debian.org/unstable/x11/bbrun"
license=('GPL')
depends=('gtk2' 'libxpm')
#source=(http://www.darkops.net/bbrun/$pkgname-$pkgver.tar.gz)
source=("list.patch"
	"http://ftp.de.debian.org/debian/pool/main/b/bbrun/bbrun_$pkgver.orig.tar.gz")
md5sums=('820960e3d52ddf2d5cf7e4ba51821bfd')

prepare() {
  cd $pkgname-$pkgver
  patch -Np2 -b -z .orig -i ../list.patch
}

build() {
  cd $pkgname-$pkgver/$pkgname
  make LIBS="-lXpm `pkg-config --libs gtk+-2.0` -lX11 -lXext"
}

package() {
  cd $pkgname-$pkgver/$pkgname
  install -Dm755 bbrun "$pkgdir"/usr/bin/bbrun
}
md5sums=('721d65fc76d1985133d2dcfaf604d7b3'
         '820960e3d52ddf2d5cf7e4ba51821bfd')
