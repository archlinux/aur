# Maintainer: Matthew Taylor <mtaylor1252dev@gmail.com>

pkgname=slock-solarized-dark
_pkgname=slock
pkgver=1.4
pkgrel=1
pkgdesc="Simple X display locker."
arch=("x86_64")
url="https://tools.suckless.org/slock/"
license=("MIT")
depends=("libxrandr")
provides=("slock")
source=(https://dl.suckless.org/tools/$_pkgname-$pkgver.tar.gz
        config.h
        solarized.patch)
sha256sums=("b53849dbc60109a987d7a49b8da197305c29307fd74c12dc18af0d3044392e6a"
            "fd86100f2dd81fc41a4b4cb2a54a6076d393b08ab43d98b5e5ba7bbf1218fe71"
            "1d9b1dad24cd6bf51f7ce39b855634dcbb301ae22f79ddcf44fa09fad8dc4e79")

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  cp $srcdir/config.h config.h
  patch -p0 -i $srcdir/solarized.patch
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 README $pkgdir/usr/share/doc/$_pkgname/README
}

