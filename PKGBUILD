# Maintainer: Noor Christensen <archlinux_AT_technopragmatics_DOT_org>
# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
pkgname=tut
pkgver=2.0.1
pkgrel=3
pkgdesc='A TUI for Mastodon with vim inspired keys'
arch=('any')
conflicts=('tut-bin')
url="https://github.com/RasmusLindroth/$pkgname"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('afa8c49036461a36c091d83ef51f9a3bbd938ee78f817c6467175699a989b863')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 config.example.toml "$pkgdir"/usr/share/doc/$pkgname/config.example.toml
  install -Dm644 config/toot.tmpl "$pkgdir"/usr/share/doc/$pkgname/toot.tmpl
  install -Dm644 config/user.tmpl "$pkgdir"/usr/share/doc/$pkgname/user.tmpl
  install -d "$pkgdir"/usr/share/doc/$pkgname/themes/
  install -Dm644 config/themes/* "$pkgdir"/usr/share/doc/$pkgname/themes/
  install -Dm644 docs/man/tut.1 "$pkgdir"/usr/share/man/man1/tut.1
  install -Dm644 docs/man/tut.5 "$pkgdir"/usr/share/man/man5/tut.5
  install -Dm644 docs/man/tut.7 "$pkgdir"/usr/share/man/man7/tut.7
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
