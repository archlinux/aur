# Maintainer: calmcrow <calmcrow@outlook.com>
# Adapted from deepseek-harness-bin by Byeonghoon Yoo <bhyoo@bhyoo.com> (https://aur.archlinux.org/packages/deepseek-harness-bin)

pkgname=dsh-tui-bin
_npmver=0.8.6
pkgver=0.8.6
pkgrel=1
pkgdesc='Claude Code style fullscreen TUI launcher for DeepSeek Harness (dsh)'
arch=('x86_64')
url='https://github.com/ccch1mneyyy/dsh-TUI'
license=('MIT')
depends=('deepseek-harness' 'nodejs' 'pnpm')
makedepends=('npm')
options=('!strip')
provides=('dsh-tui')
source=("dsh-tui-${_npmver}.tgz::https://registry.npmjs.org/@deepseek-harness-tui/dsh-tui/-/dsh-tui-${_npmver}.tgz")
sha256sums=('a28d9f62dac49ab12c305e74e1ec9eed5396838e73b28406b467e3841192d1c4')

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
