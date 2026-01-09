# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-pty
_pkgname=opencode-pty
pkgver=0.1.4
pkgrel=1
pkgdesc="OpenCode plugin for interactive PTY management - run background processes, send input, read output with regex filtering"
arch=('any')
url="https://github.com/shekohex/opencode-pty"
license=('MIT')
depends=('opencode')
makedepends=('jq')
options=('!strip' '!debug')
install=$pkgname.install

source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('056d309bd4130082295dbbcbc2e273017ce3fdfb8a58003b57a140a79f2b89ab')

latestver() {
    curl -fsSL "https://registry.npmjs.org/$_pkgname/latest" | jq -r '.version'
}

package() {
    mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
    tar -xzf "$srcdir/$pkgname-$pkgver.tgz" -C "$pkgdir/usr/lib/opencode/plugins/$pkgname" --strip-components=1

    install -Dm644 "$pkgdir/usr/lib/opencode/plugins/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
