# former Maintainer: Brenton Horne

pkgname=hugo
pkgver=0.20.7
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
sha512sums=('fcefc96f21acecf2b565ba087e38c72b07c820405759467969ebc6cc032f6059fa02a86722f21254355e74de32f8fee2c89151615c1d22a00e2253492339ea14')

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
