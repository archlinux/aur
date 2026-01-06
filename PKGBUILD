# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-pty
_pkgname=opencode-pty
pkgver=0.1.2
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
sha256sums=('db34c27e7d3ece5b9dbd0c801e74843c44ce8a242b34047d24ebae77546386c8')

latestver() {
    curl -fsSL "https://registry.npmjs.org/$_pkgname/latest" | jq -r '.version'
}

package() {
    mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
    tar -xzf "$srcdir/$pkgname-$pkgver.tgz" -C "$pkgdir/usr/lib/opencode/plugins/$pkgname" --strip-components=1

    install -Dm644 "$pkgdir/usr/lib/opencode/plugins/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
