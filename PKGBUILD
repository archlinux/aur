# former Maintainer: Brenton Horne

pkgname=hugo
pkgver=0.21
pkgrel=1
pkgdesc="Fast and Flexible Static Site Generator in Go — built from source."
arch=('i686' 'x86_64')
url="http://hugo.spf13.com/"
conflicts=("${pkgname}-src" "${pkgname}-bin")
license=('Apache')
depends=('glibc')
optdepends=('pygmentize: syntax-highlight code snippets.')
makedepends=('go' 'git' 'govendor')
source=("$pkgname-$pkgver.tar.gz::https://github.com/spf13/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('2625d47a09cb7ba2b41697b5e325c00ca66e89cffe6b5cb97c5786fd80b55ed290dda1f3c3c4d7ea4b03b685c8bdd66a5b3fd14edefb8f0ca614608b590c2f7d')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/spf13"
  ln -s `pwd` "$GOPATH/src/github.com/spf13/hugo"
  cd "$GOPATH/src/github.com/spf13/hugo"
  make no-git-info
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
