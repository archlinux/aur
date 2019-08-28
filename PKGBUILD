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
        slock-nobody-$pkgver.diff
        slock-solarized-dark-$pkgver.diff
        slock-yutna-$pkgver.diff)
sha256sums=("b53849dbc60109a987d7a49b8da197305c29307fd74c12dc18af0d3044392e6a"
            "ca2229fdbded92150a7050c59c5237d2c52e77cd4c36050ffc5fa31600ab9d41"
            "0c668deac297a395cf6211b8940818b0d9ffd46ff6cf101a883b244cebf32d72"
            "baf1766a7a09d13601ec5d625415d1d3e5ce183f9d1b6b0b8c27298f26308bae")

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  patch -p1 -i $srcdir/slock-nobody-$pkgver.diff
  patch -p1 -i $srcdir/slock-solarized-dark-$pkgver.diff
  patch -p1 -i $srcdir/slock-yutna-$pkgver.diff
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
