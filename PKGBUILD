# Maintainer Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=hugo-src
_pkgname=hugo
pkgver=0.16
pkgrel=2
pkgdesc="Fast and Flexible Static Site Generator in Go — built from source."
arch=('i686' 'x86_64')
url="http://hugo.spf13.com/"
conflicts=("${_pkgname}")
license=('Apache')
depends=('glibc')
makedepends=('go' 'git' 'mercurial')
source=("https://github.com/spf13/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  # Force our own git checkout
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/spf13"
  ln -s `pwd` "$GOPATH/src/github.com/spf13/hugo"

  go get -d -v . || printf "Failed at go get"
  make no-git-info || printf "make no-git-info failed"
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
