# Maintainer: Noor Christensen <archlinux_AT_technopragmatics_DOT_org>
# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-mastodon
pkgver=2.0.1
pkgrel=2
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, only for name collision.'
arch=('any')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')
makedepends=('go')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('afa8c49036461a36c091d83ef51f9a3bbd938ee78f817c6467175699a989b863')

build() {
  cd $_pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o $pkgname .
}

package() {
  cd $_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 config.example.toml "$pkgdir"/usr/share/doc/$pkgname/config.example.toml
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$pkgname/user.tmpl
  install -d "$pkgdir"/usr/share/doc/$pkgname/themes/
  install -Dm644 config/themes/* "$pkgdir"/usr/share/doc/$pkgname/themes/
  install -Dm644 docs/man/tut.1 "$pkgdir"/usr/share/man/man1/tut-mastodon.1
  install -Dm644 docs/man/tut.5 "$pkgdir"/usr/share/man/man5/tut-mastodon.5
  install -Dm644 docs/man/tut.7 "$pkgdir"/usr/share/man/man7/tut-mastodon.7
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
