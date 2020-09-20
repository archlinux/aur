# Maintainer: Alexis Janon <kardyne -at- gmail -dot- com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Zhukov Pavel <gelios@gmail.com>
# Contributor: Christof Musik <christof@senfdax.de>
# Contributor: Falconindy
pkgname=slurm
pkgver=0.4.3
pkgrel=2
pkgdesc="Monitoring traffic statistics in realtime"
url="https://github.com/mattthias/slurm/wiki"
license=("GPL")
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('cmake')
source=("https://github.com/mattthias/$pkgname/archive/upstream/$pkgver.tar.gz"
        "sysctl.patch")
md5sums=('ff39b8e1fd31274ba1bb36d4aadc1d48'
         'b8badc91fcfcfefebf68f1e4635c6e5f')

prepare() {
  cd "$srcdir/$pkgname-upstream-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/sysctl.patch"
}

build() {
  cd "$srcdir/$pkgname-upstream-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$pkgname-upstream-$pkgver/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../slurm.1 "$pkgdir/usr/share/man/man1/slurm.1"
}
