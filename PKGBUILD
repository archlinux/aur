# Maintainer: sandwichfarm <sandwich.farm@protonmail.com>

pkgname=nsyte
pkgver=0.29.0
pkgrel=1
pkgdesc="Publish your site to nostr and blossom servers"
arch=('x86_64')
url="https://github.com/sandwichfarm/nsyte"
license=('MIT')
makedepends=('deno')
conflicts=('nsyte-bin' 'nsite-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('06cda36981c247eb80e1fe6aa1f1e62d5f1e6c5ca2b6becee2bf7b5aba7bf6e2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  deno compile --no-check \
    --allow-run \
    --allow-read \
    --allow-write \
    --allow-net \
    --allow-env \
    --allow-sys \
    --target "${CARCH}-unknown-linux-gnu" \
    --output dist/nsyte \
    src/cli.ts
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "dist/nsyte" "${pkgdir}/usr/bin/nsyte"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
