_pkgname=libsmallfry
pkgname=$_pkgname-git
pkgver=0.1.2.r0.ge6d4939
pkgrel=1
pkgdesc='Smallfry metric for JPEG Optimization'
arch=(x86_64)
url="https://github.com/ImageProcessing-ElectronicPublications/$_pkgname"
license=(BSD)
depends=(glibc)
makedepends=(git)
optdepends=()
provides=("$_pkgname")
conflicts=(${provides[@]})
source=("$pkgname"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" install

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/doc/libsmallfry0/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
