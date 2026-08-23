# Maintainer: calmcrow <calmcrow@outlook.com>
# Adapted from deepseek-harness-bin by Byeonghoon Yoo <bhyoo@bhyoo.com> (https://aur.archlinux.org/packages/deepseek-harness-bin)

pkgname=dsh-tui-bin
_npmver=0.9.0
pkgver=0.9.0
pkgrel=1
pkgdesc='Claude Code style fullscreen TUI launcher for DeepSeek Harness (dsh)'
arch=('x86_64')
url='https://github.com/ccch1mneyyy/dsh-TUI'
license=('MIT')
depends=('deepseek-harness' 'nodejs' 'pnpm')
makedepends=('npm')
options=('!strip')
provides=('dsh-tui')
conflicts=('dsh-tui' 'dsh-git')
source=("dsh-tui-${_npmver}.tgz::https://registry.npmjs.org/@deepseek-harness-tui/dsh-tui/-/dsh-tui-${_npmver}.tgz")
sha256sums=('1604bf456c740743064bab07d91a1f083fb64dcc335d9b43dbddc0b96c1fe66e')

prepare() {
    rm -rf npm-root npm-cache
    mkdir -p npm-root/usr npm-cache

    npm install --global \
        --prefix "$srcdir/npm-root/usr" \
        --cache "$srcdir/npm-cache" \
        --omit=dev \
        --omit=peer \
        --no-audit \
        --no-fund \
        --legacy-peer-deps \
        "$srcdir/dsh-tui-${_npmver}.tgz"
}

package() {
    cp -a "$srcdir/npm-root/usr/." "$pkgdir/usr/"
    install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
    chown -R root:root "$pkgdir"
}
