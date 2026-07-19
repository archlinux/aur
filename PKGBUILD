# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=meridian
pkgver=1.54.0
pkgrel=1
pkgdesc="Use your Claude Max subscription with OpenCode, OpenClaw, Pi, Droid, Aider, Crush, Cline."
arch=(any)
url="https://github.com/rynfar/meridian"
license=(MIT)
depends=(nodejs)
makedepends=(bun)
provides=(meridian)
source=(https://github.com/rynfar/$pkgname/archive/refs/tags/$pkgname-v$pkgver.tar.gz)
sha512sums=('e3e57dce5f92bb443309945d78b118b0417f0f477fd820a4370f24642c6e2dd99a53edc3bfd9891aeb9d2d1742163006bfb14d204b114005c34870683cfd8562')

build() {
  cd "$srcdir/$pkgname-${pkgname}-v${pkgver}"

  bun install
  bun run build
}

package() {
  cd "$srcdir/$pkgname-${pkgname}-v${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a dist plugin node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/${pkgname}/dist/cli.js" "$pkgdir/usr/bin/${pkgname}"
}
