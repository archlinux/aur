# Maintainer: calmcrow <calmcrow@outlook.com>
# Adapted from deepseek-harness-bin by Byeonghoon Yoo <bhyoo@bhyoo.com> (https://aur.archlinux.org/packages/deepseek-harness-bin)

pkgname=dsh-tui-bin
_npmver=0.13.0
pkgver=0.13.0
pkgrel=1
pkgdesc='Claude Code style fullscreen TUI launcher for DeepSeek Harness (dsh)'
arch=('x86_64')
url='https://github.com/ccch1mneyyy/dsh-TUI'
license=('MIT')
depends=('deepseek-harness' 'nodejs' 'pnpm')
makedepends=('npm')
install=dsh-tui-bin.install
options=('!strip')
provides=('dsh-tui')
conflicts=('dsh-tui' 'dsh-git')
source=("dsh-tui-${_npmver}.tgz::https://registry.npmjs.org/@deepseek-harness-tui/dsh-tui/-/dsh-tui-${_npmver}.tgz")
sha256sums=('0e84f15d1ef831caacf1758cba634b03ab9108d772e8f776a751e381a1ce9ddc')

prepare() {
    rm -rf npm-root npm-cache
    mkdir -p npm-root/usr npm-cache

    npm install --global \
        --prefix "$srcdir/npm-root/usr" \
        --cache "$srcdir/npm-cache" \
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
