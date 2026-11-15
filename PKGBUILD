# Maintainer: crux <crrvx@outlook.com>

pkgname=dsh-bin
pkgver=0.2.2_rc.3
pkgrel=1
pkgdesc='DeepSeek Harness: Everything is a Plugin'
arch=('x86_64' 'aarch64')
url='https://github.com/deepseek-ai/deepseek-harness'
license=('MIT')
depends=('nodejs' 'pnpm')
makedepends=('npm')
options=('!strip')
provides=('dsh')
conflicts=('dsh' 'dsh-git' 'deepseek-harness' 'deepseek-harness-git' 'deepseek-harness-bin')
source=("dsh-${pkgver}.tgz::https://registry.npmjs.org/@deepseek-ai/dsh/-/dsh-${pkgver//_/-}.tgz")
sha256sums=('b8f5a72660270cdded0f4c4fa0cfdc0cf851c261f09bbcf5e2bb56019bab0873')

package() {
  npm install --global \
    --prefix "${pkgdir}/usr" \
    --cache "${srcdir}/npm-cache" \
    --omit=dev \
    --no-audit \
    --no-fund \
    --allow-scripts=@deepseek-ai/dsh-subprocess-local,koffi,node-pty,@google/genai,protobufjs \
    "${srcdir}/dsh-${pkgver}.tgz"

  install -Dm644 "${srcdir}/package/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
