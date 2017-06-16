# Maintainer: fordprefect
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
# Contributor: Brenton Horne

pkgname=hugo
pkgver=0.23
pkgrel=2
pkgdesc="Fast and Flexible Static Site Generator in Go — built from source."
arch=('i686' 'x86_64')
url="https://gohugo.io/"
conflicts=("${pkgname}-src" "${pkgname}-bin")
license=('Apache')
depends=('glibc')
optdepends=('pygmentize: syntax-highlight code snippets.')
makedepends=('go' 'git' 'govendor')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gohugoio/hugo/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('4bc54b3ca3b126d6cf3761e78430f77dcf7ba0fad3c858573449c4e4b4e8842000a5e4d1a48589d4db18456eda327b634ff608afe7986b249380518eb755d93c')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/gohugoio"
  ln -s "$(pwd)" "$GOPATH/src/github.com/gohugoio/hugo"
  cd "$GOPATH/src/github.com/gohugoio/hugo"
  make no-git-info
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
