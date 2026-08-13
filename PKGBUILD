pkgname=deepseek-harness-bin
_npmver=0.1.0-rc.6
pkgver=0.1.0_rc.6
pkgrel=1
pkgdesc='DeepSeek Harness CLI and agent harness'
arch=('x86_64')
url='https://github.com/deepseek-ai/deepseek-harness'
license=('MIT')
depends=('nodejs>=22.19.0')
makedepends=('npm')
options=('!strip')
provides=('deepseek-harness' 'dsh')
conflicts=('deepseek-harness' 'deepseek-harness-git')
source=("dsh-${_npmver}.tgz::https://registry.npmjs.org/@deepseek-ai/dsh/-/dsh-${_npmver}.tgz")
sha256sums=('1b8a9a0ad3c7feaece47926e0bd37ca151c7ccfa997953afa5fd01261784eadc')

prepare() {
  rm -rf npm-root npm-cache
  mkdir -p npm-root/usr npm-cache

  npm install --global \
    --prefix "$srcdir/npm-root/usr" \
    --cache "$srcdir/npm-cache" \
    --omit=dev \
    --no-audit \
    --no-fund \
    "$srcdir/dsh-${_npmver}.tgz"
}

package() {
  cp -a "$srcdir/npm-root/usr/." "$pkgdir/usr/"
  chmod -R u+rwX,go+rX,go-w "$pkgdir/usr/lib/node_modules"
}
