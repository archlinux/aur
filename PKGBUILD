pkgname=serialosc-git
pkgver=20150928
pkgrel=1
pkgdesc="serialosc is an OSC server for Monomes"
arch=("i686" "x86_64")
license=("ISC")
url="https://github.com/monome/serialosc"
source=("$pkgname::git+https://github.com/monome/serialosc")
md5sums=('SKIP')

depends=("libmonome-git" "confuse" "liblo" "avahi" "udev")
conflicts=("serialosc")
provides=("serialosc")

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init
  ./waf configure --prefix=$pkgdir/usr
}

build() {
  cd "$srcdir/$pkgname"
  ./waf
}

package() {
  cd "$srcdir/$pkgname"
  ./waf install
}
