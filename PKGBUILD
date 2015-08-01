pkgname=libmonome-git
pkgver=20150603
pkgrel=1
pkgdesc="Makes writing applications for Monomes easy"
arch=("i686" "x86_64")
license=("ISC")
url=("https://github.com/monome/libmonome")
source=("$pkgname::git+https://github.com/monome/libmonome")
md5sums=('SKIP')
conflicts=("libmonome")
provides=("libmonome")
depends=("liblo" "udev")

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

prepare() {
  cd "$srcdir/$pkgname"
  ./waf configure --prefix=$pkgdir/usr
}

build()
{
  cd "$srcdir/$pkgname"
  ./waf
}

package() {
  cd "$srcdir/$pkgname"
  ./waf install
}
