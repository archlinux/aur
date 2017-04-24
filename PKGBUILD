# former Maintainer: Brenton Horne

pkgname=hugo
pkgver=0.20.3
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
sha512sums=('bd291566fc9cb0d7c49b1a3960970bedc2e3572b903d5483dd77b4aa34c71176209f1306c2317c934131e1181a08c22bcc4c143e8c300f4225d73d9aea7f9a11')

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
