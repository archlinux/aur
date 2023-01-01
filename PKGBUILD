# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
pkgname=tut
pkgver=1.0.34
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys'
arch=('any')
conflicts=('tut-bin')
url="https://github.com/RasmusLindroth/$pkgname"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4340e41395cb8cf56e11f500738ef85b838dbfeddf219c988a058e4789009a69')

build() {
  cd $pkgname-$pkgver
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$pkgname/user.tmpl
  install -d "$pkgdir"/usr/share/doc/$pkgname/themes/
  install -Dm644 config/themes/* "$pkgdir"/usr/share/doc/$pkgname/themes/
  install -Dm644 docs/man/tut.1 "$pkgdir"/usr/share/man/man1/tut.1
  install -Dm644 docs/man/tut.5 "$pkgdir"/usr/share/man/man5/tut.5
  install -Dm644 docs/man/tut.7 "$pkgdir"/usr/share/man/man7/tut.7
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
