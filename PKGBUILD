_pkgname=libiqa
pkgname="$_pkgname-git"
pkgver=1.1.3.r2.g4687a4c
pkgrel=1
pkgdesc='Image Quality Assessment (IQA) - fast, accurate, and reliable C library for measuring image quality'
arch=(x86_64)
url="https://github.com/ImageProcessing-ElectronicPublications/libiqa"
license=(BSD)
depends=(glibc)
makedepends=(git)
optdepends=()
provides=("$_pkgname")
conflicts=(${provides[@]})
source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX="$pkgdir/usr" install

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/doc/libiqa1/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
