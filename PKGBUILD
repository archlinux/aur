# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=1.0.65
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode-bin')
depends=('fzf' 'ripgrep')
makedepends=('git' 'bun-bin' 'go')

source=("opencode-${pkgver}.tar.gz::https://github.com/sst/opencode/archive/v${pkgver}${_subver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "opencode-${pkgver}"
  bun install
  cd ./packages/opencode
  OPENCODE_CHANNEL=latest OPENCODE_VERSION=1.0.65 bun run ./script/build.ts --single
}

package() {
  cd "opencode-${pkgver}/packages/opencode"
  install -Dm755 $(find dist/*/bin/opencode) "${pkgdir}/usr/bin/opencode"
}
