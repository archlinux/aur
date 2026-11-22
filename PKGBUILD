# Maintainer: crux <crrvx@outlook.com>

pkgname=dsh-bin
pkgver=0.2.3_alpha.2
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
sha256sums=('9900793a077ffa6c9794f7349c7c69120cd6a24dec4163837a7256167e61d250')

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
