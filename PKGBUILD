# former Maintainer: Brenton Horne

pkgname=hugo
pkgver=0.20.5
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
sha512sums=('68672cfeb4d6375325726ffbee9de7ee7c54e009a8131ddeded720c95a0b5f44bb6309ff6f1617d6b54f5e532d7087efeb6f3b978864b1042322d3c664bd4bf0')

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
