# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: void09  <sgmihai@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: triaxx

pkgname=gnuclad
pkgver=0.2.4
pkgrel=4
pkgdesc="A cladogram tree generator mainly used by Linux and BSD distribution timeline projects"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
license=(GPL)
url="https://launchpad.net/gnuclad"
source=("http://launchpad.net/gnuclad/trunk/0.2/+download/$pkgname-$pkgver.tar.gz"
        "gnuclad-fix-build.diff::https://github.com/FabioLolix/gnuclad/commit/0cac2b6088d279dd495949a5305ff55b77737da1.diff")
sha256sums=('7136ee0e36d8de61a97235556f879bb0abe6521efb65a5a97bc73979999e424d'
            '8b50865427b8546ec221db65873cec75b8500c4bb99d1969eca6d9deee18c65a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../gnuclad-fix-build.diff
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D doc/man/gnuclad.1 "${pkgdir}"/usr/share/man/man1/gnuclad.1
}
