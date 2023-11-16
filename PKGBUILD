# Maintainer: xiota / aur.chaotic.cx

_pkgname="libsmallfry"
pkgname="$_pkgname-git"
pkgver=0.2.0.r2.gc31c6a4
pkgrel=2
pkgdesc='Smallfry metric for JPEG optimization'
url="https://github.com/ImageProcessing-ElectronicPublications/libsmallfry"
license=(BSD)
arch=(x86_64)

depends=(glibc)
makedepends=(git)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

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

  install -Dm644 "LICENSE" -t "${pkgdir:?}/usr/share/licenses/$pkgname/"

  rm -rf "${pkgdir:?}/usr/share/doc/"
}
