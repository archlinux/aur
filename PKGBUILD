# Maintainer: $MAINTAINER

pkgname=rumus
pkgver=0.1.18
pkgver() {
  curl -s --connect-timeout 5 "https://bucket.rumus.ai/rumus-releases/latest.json" \
  | sed -n 's/.*"version"[[:space:]]*:[[:space:]]*"\?v\?\([0-9\.]*\)"\?.*/\1/p' \
  | head -n 1
}
pkgrel=1
pkgdesc="Next-generation terminal"
arch=('x86_64' 'aarch64')
url="https://rumus.ai"
license=('Proprietary')
depends=('webkit2gtk-4.1' 'gtk3')

source_x86_64=("rumus.deb::https://bucket.rumus.ai/rumus-releases/v${pkgver}/linux-x64/rumus.deb")
source_aarch64=("rumus.deb::https://bucket.rumus.ai/rumus-releases/v${pkgver}/linux-arm64/rumus.deb")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  bsdtar -xf "${srcdir}/rumus.deb"
  bsdtar -xf data.tar.gz -C "${pkgdir}/"
}
