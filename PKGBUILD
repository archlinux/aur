# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=ariadne
pkgver=1.3
pkgrel=2
pkgdesc="A package for comparison protein sequences and profiles"
arch=('i686' 'x86_64')
url="http://www.well.ox.ac.uk/ariadne/"
license=('custom')
depends=('glibc')
source=("http://www.well.ox.ac.uk/ariadne/${pkgname}-${pkgver}.tar.Z"
        "${pkgname}-${pkgver}-gcc4.patch")
md5sums=('240dc8b278a02b0fcdf56cd186d9b0ec'
         '85fea40cfa602b59790ef65c90cd23b6')

prepare() {
  cd "$srcdir/SRC-$pkgver"
  # Patch contributed by Gentoo maintainer
  patch -Np0 -i ../$pkgname-$pkgver-gcc4.patch
}

build() {
  cd "$srcdir/SRC-$pkgver"
  make
}

package() {
  cd "$srcdir/SRC-$pkgver"

  # Install binaries
  mkdir -p "$pkgdir/usr/bin"
  install -m755 Linux/{ariadne,prospero} "$pkgdir/usr/bin"

  # Install a license file
  install -Dm644 README "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

