# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Samadi van Koten

pkgname=umoci
pkgver=0.4.0
pkgrel=1
pkgdesc="Umoci Modifies Open Container Images"
arch=('i686' 'x86_64')
url="https://umo.ci/"
license=('Apache 2.0')
depends=()
makedepends=("go")
conflicts=()
provides=()
options=()
source=("https://github.com/openSUSE/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7542c4c1d035a0d50c7de7671cfbee75')

_repo_name="github.com/openSUSE/$pkgname"

prepare() {
  rm -rf "$srcdir/src/$_repo_name"
  mkdir -p "$srcdir/src/$_repo_name"
  mv -Tf "$srcdir/$pkgname-$pkgver" "$srcdir/src/$_repo_name"
}

build() {
  cd "$srcdir/src/$_repo_name"
  GOPATH="$srcdir" make
  GOPATH="$srcdir" make doc
}

package() {
  cd "$srcdir/src/$_repo_name"
  install -Dm 755 -t "$pkgdir/usr/bin" umoci
  install -Dm 644 -t "$pkgdir/usr/share/man/man1" doc/man/*1
}
