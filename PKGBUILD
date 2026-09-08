# Maintainer: sandwichfarm <sandwich.farm@protonmail.com>

pkgname=nsyte
pkgver=0.28.1
pkgrel=1
pkgdesc="Publish your site to nostr and blossom servers"
arch=('x86_64')
url="https://github.com/sandwichfarm/nsyte"
license=('MIT')
makedepends=('deno')
conflicts=('nsyte-bin' 'nsite-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('190710bc423f8293f51d30e1858951d180c528b65699e4523fc9b283df521914')

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
