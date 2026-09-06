# Current Contributor: Doug Penner <darwinsurvivor@gmail.com>
# Past Contributor: Marco Praher <marco.praher@gmx.at>
pkgname=gnocky
pkgver=0.0.7
pkgrel=4
pkgdesc='GTK written GUI frontend for gnokii'
arch=('i686' 'x86_64')
url='https://web.archive.org/web/20260215071737/http://www.gnokii.org/'
license=('GPL')
depends=('libglade' 'gnokii>=0.6.26' 'libical')
makedepends=('make' 'gcc')
source=("http://download.samba.org/pub/gnokii/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('90dcf5c2e2e6fcf81802ddda9477ab7b1ddb15fbe476c40f93de739995d2c0a3')

build() {
  cd $srcdir/$pkgname-$pkgver
  export CFLAGS+=" -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"
  ./configure LIBS=-lgthread-2.0
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr/share/${pkgname} install
  mkdir -p $pkgdir/usr/bin/
  ln -s "/usr/share/gnocky/bin/gnocky" "$pkgdir/usr/bin/gnocky"
}

