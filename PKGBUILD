# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>

pkgname=xf86-input-mtrack
pkgver=0.3.1
pkgrel=1
pkgdesc="An Xorg driver for multitouch trackpads and clickpads"
arch=('i686' 'x86_64')
url="http://github.com/BlueDragonX/$pkgname"
license=('GPL2')
depends=('mtdev' 'libxss')
makedepends=('xorg-server-devel' 'resourceproto' 'glproto')
backup=('etc/X11/xorg.conf.d/10-mtrack.conf')
source=(10-mtrack.conf
        $url/archive/v$pkgver.tar.gz)
md5sums=('ffb540330d92957e0da28af5a005136e'
         'cc99ea395ec588a790d2145815f48fa2')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  mkdir -p m4

  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir"/ install

  install -Dm644 "$srcdir"/10-mtrack.conf "$pkgdir"/etc/X11/xorg.conf.d/10-mtrack.conf
}
