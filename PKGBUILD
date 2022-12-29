# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-mastodon
pkgver=1.0.31
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, only for name collision.'
arch=('any')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')
makedepends=('go')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('dc64e8ae81d87aad156a1a23b40c974c2dd4326cfe46ac149df30576305182a5')

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
  install -d "$pkgdir"/usr/share/doc/$pkgname/themes/
  install -Dm644 config/themes/* "$pkgdir"/usr/share/doc/$pkgname/themes/
  install -Dm644 docs/man/tut.1 "$pkgdir"/usr/share/man/man1/tut-mastodon.1
  install -Dm644 docs/man/tut.5 "$pkgdir"/usr/share/man/man5/tut-mastodon.5
  install -Dm644 docs/man/tut.7 "$pkgdir"/usr/share/man/man7/tut-mastodon.7
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
