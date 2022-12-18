# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-mastodon
pkgver=1.0.28
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, only for name collision.'
arch=('any')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')
makedepends=('go')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6dbc41e0615e1e2a2e1d56ecf2a3a9f555bb39ab16fabc8f4a0cdc35735188bf')

build() {
  cd $_pkgname-$pkgver
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 config.example.ini "$pkgdir"/usr/share/doc/$pkgname/config.example.ini
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$pkgname/user.tmpl
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
