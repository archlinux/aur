# Maintainer: crux <crrvx@outlook.com>

pkgname=dsh-bin
pkgver=0.2.3_alpha.1
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
sha256sums=('cbf6f22f8c621b0f3c3e9a24eb5934c0d4641db58a90562d32f377bd2ce04fb3')

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
