# Maintainer: Aiden Tingler <tingleraiden@icloud.com>
pkgname=pplhatearch
pkgver=1.1.1
pkgrel=1
pkgdesc="Yay-like helper that pulls packages from the GitHub AUR backup"
arch=('x86_64')
url="https://github.com/aiden04/pplhatearch"
license=('MIT')
depends=('pacman' 'git')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aiden04/pplhatearch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w" -o pplhatearch .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 pplhatearch "$pkgdir/usr/bin/pplhatearch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/pplhatearch/README.md"

  install -Dm644 completions/pplhatearch.bash \
    "$pkgdir/usr/share/bash-completion/completions/pplhatearch"
  install -Dm644 completions/pplhatearch.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_pplhatearch"
  install -Dm644 completions/pplhatearch.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/pplhatearch.fish"
}
