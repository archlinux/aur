# Maintainer: Panos Kanavos <panoskanavos@gmail.com>
pkgname=mgiza
pkgver=3.0
pkgrel=1
pkgdesc='Multithreaded version of Giza, a statical machine translation toolkit used to train word alignment models'
arch=('i686' 'x86_64')
url='https://github.com/moses-smt/mgiza'
license=('GPL2')
makedepends=(gcc cmake boost boost-libs)
depends=("python" "bash")
conflicts=("mgiza-git" "giza-pp-git")
provides=("giza")
install=
source=("$pkgname::git+https://github.com/moses-smt/$pkgname.git#branch=RELEASE-$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname/mgizapp"
  cmake -DCMAKE_INSTALL_PREFIX=/opt/mgiza
  make
}

package() {
  cd "$srcdir/$pkgname/mgizapp"
  make DESTDIR="$pkgdir/" install
  chmod a+rx $pkgdir/opt/$pkgname/scripts/*
}
