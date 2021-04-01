# Maintainer: Parth576  <bruhhh192@gmail.com>
pkgname=gowords
pkgver=v0.0.8
pkgrel=1
pkgdesc='CLI wrapper for dictionaryapi.dev. Search word definitions and memorize words.'
arch=('x86_64')
url="https://github.com/Parth576/dictionary-cli"
license=('GPL')
depends=('glibc')
makedepends=('go')
source=("https://github.com/Parth576/dictionary-cli/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2d55f112c6ce0e7dfa51c11b647dddda277c1d86079dd354f9f352185706f9d0')

ver=$(echo "$pkgver" | sed 's/v//')

prepare(){
  cd "dictionary-cli-$ver"
  mkdir -p build/
}

build() {
  cd "dictionary-cli-$ver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -trimpath -buildmode=pie .
}

package() {
  cd "dictionary-cli-$ver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
