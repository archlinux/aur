# Maintainer: aksr <aksr at t-com dot me>
pkgname=metamath
pkgver=0.138
pkgrel=1
epoch=
pkgdesc="A tiny language that can express theorems in abstract mathematics, accompanied by proofs that can be verified."
arch=('i686' 'x86_64')
url="http://us.metamath.org/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("http://us.metamath.org/downloads/$pkgname.tar.gz"
        "http://us.metamath.org/downloads/$pkgname.pdf")
noextract=()
options=()
md5sums=('0a16090d623e99ba13bc8b50a4b90bad'
         'f3c00e4fdb275f41bb631aa26159a356')
sha1sums=('38b221ef0d0fddafbac08f78f233b6425ee8dd45'
          'c8b92bf1aee4735f28daff093b27626eaf062c9b')
sha256sums=('f41f09ce49195b63b9a1b4e7ad85d8d0effa763c7f8b3f46d23f99aea731f09c'
            '39957bbdb6fdbb7ebb4627b57f2da9b8ff758b78f292502bbf1a53ce562d2111')

build() {
  cd "$srcdir/$pkgname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname"
  make -k check
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 README.TXT $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 ../metamath.pdf $pkgdir/usr/share/doc/$pkgname/metamath.pdf
  install -Dm644 LICENSE.TXT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

