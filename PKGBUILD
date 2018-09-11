# Maintainer: Stefan Agner <stefan@agner.ch>
# Contributor: Samadi van Koten

pkgname=umoci
pkgver=0.4.2
pkgrel=1
pkgdesc="Umoci Modifies Open Container Images"
arch=('i686' 'x86_64')
url="https://umo.ci/"
license=('Apache 2.0')
depends=()
makedepends=('go' 'go-md2man')
conflicts=()
provides=()
options=()
source=("https://github.com/openSUSE/$pkgname/releases/download/v$pkgver/umoci.tar.xz")
sha256sums=('98d481d620c3d52b8fe1a2db07515c319fd2688253acd40bf09525ad599705e7')

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
