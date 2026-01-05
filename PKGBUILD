# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-pty
_pkgname=opencode-pty
pkgver=0.1.1
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
sha256sums=('a4bd168d487388aa0f623c224d1332e160d825ff20a6ec1aafae9d966d747dc5')

latestver() {
    curl -fsSL "https://registry.npmjs.org/$_pkgname/latest" | jq -r '.version'
}

package() {
    mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
    tar -xzf "$srcdir/$pkgname-$pkgver.tgz" -C "$pkgdir/usr/lib/opencode/plugins/$pkgname" --strip-components=1

    install -Dm644 "$pkgdir/usr/lib/opencode/plugins/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
