# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=dsh-superagent-prototype-bin
_npmver=0.1.3
pkgver=0.1.3
pkgrel=1
pkgdesc='DSH Superagent prototype — proactive GitHub/Feishu agent bundle for DeepSeek Harness'
arch=('x86_64' 'aarch64')
url='https://github.com/deepseek-ai/dsh-superagent-prototype'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=('!strip')
provides=('dsh-superagent-prototype')
conflicts=('dsh-superagent-prototype' 'dsh-superagent-prototype-git')
source=("dsh-superagent-prototype-${_npmver}.tgz::https://registry.npmjs.org/dsh-superagent-prototype/-/dsh-superagent-prototype-${_npmver}.tgz")
sha256sums=('33e442680f3fcd435f62ad4ac09e1b4e3bd5a48e2a4da8b392860ca967f5ce6a')

prepare() {
  rm -rf npm-root npm-cache
  mkdir -p npm-root/usr npm-cache

  npm install --global \
    --prefix "$srcdir/npm-root/usr" \
    --cache "$srcdir/npm-cache" \
    --omit=dev \
    --no-audit \
    --no-fund \
    "$srcdir/dsh-superagent-prototype-${_npmver}.tgz"
}

package() {
  cp -a "$srcdir/npm-root/usr/." "$pkgdir/usr/"
  install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
}
