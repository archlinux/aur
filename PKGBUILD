_pkgname=jpeg-recompress
pkgname=$_pkgname-git
pkgver=2.5.7.r0.gbeef803
pkgrel=1
pkgdesc='Utilities for archiving JPEGs for long term storage - IPEP fork (fixes and webp support)'
arch=(x86_64)
url="https://github.com/ImageProcessing-ElectronicPublications/$_pkgname"
license=(MIT)
depends=(
  libiqa
  libjpeg
  libsmallfry
  libwebp
)
makedepends=(git)
optdepends=()
provides=($_pkgname jpeg-archive)
conflicts=(${provides[@]})
source=(
  "$pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

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

  install -Dm0664 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
