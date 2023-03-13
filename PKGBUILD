_pkgname=libsmallfry
pkgname="$_pkgname-git"
pkgver=0.2.0.r2.gc31c6a4
pkgrel=1
pkgdesc='Smallfry metric for JPEG Optimization'
arch=(x86_64)
url="https://github.com/ImageProcessing-ElectronicPublications/libsmallfry"
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
  ln -s /usr/share/doc/libsmallfry0/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
