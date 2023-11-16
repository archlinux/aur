# Maintainer: xiota / aur.chaotic.cx

_pkgname=libiqa
pkgname="$_pkgname-git"
pkgver=1.1.3.r2.g4687a4c
pkgrel=2
pkgdesc='Fast, accurate, and reliable C library for image quality assessment'
url="https://github.com/ImageProcessing-ElectronicPublications/libiqa"
license=(BSD)
arch=(x86_64)

depends=(glibc)
makedepends=(git)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"
  make PREFIX="$pkgdir/usr" install

  install -Dm644 "LICENSE" -t "${pkgdir:?}/usr/share/licenses/$pkgname/"

  rm -rf "${pkgdir:?}/usr/share/doc/"
}
