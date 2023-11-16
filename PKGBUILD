# Maintainer: xiota / aur.chaotic.cx

_pkgname="jpeg-recompress"
pkgname="$_pkgname-git"
pkgver=2.6.4.r1.ge6ad714
pkgrel=1
pkgdesc='Utilities for archiving JPEGs for long term storage - IPEP fork (fixes and webp support)'
url="https://github.com/ImageProcessing-ElectronicPublications/jpeg-recompress"
license=(MIT)
arch=(x86_64)

depends=(
  libiqa
  libsmallfry
  libwebp
)
makedepends=(git)

provides=(
  "$_pkgname=${pkgver%%.r*}"
  "jpeg-archive=${pkgver%%.r*}"
)
conflicts=(
  "$_pkgname"
  "jpeg-archive"
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"
  make PREFIX="$pkgdir/usr" install

  install -Dm0664 "LICENSE" -t "${pkgdir:?}/usr/share/licenses/$pkgname/"
}
