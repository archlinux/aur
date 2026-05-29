# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=meridian
pkgver=1.43.0
pkgrel=1
pkgdesc="Use your Claude Max subscription with OpenCode, OpenClaw, Pi, Droid, Aider, Crush, Cline."
arch=(any)
url="https://github.com/rynfar/meridian"
license=(MIT)
depends=(nodejs)
makedepends=(bun)
provides=(meridian)
source=(https://github.com/rynfar/$pkgname/archive/refs/tags/$pkgname-v$pkgver.tar.gz)
sha512sums=('b061305c2cd4756d22068fa7c6eb9b151ddd03923476b195d934f316fb1bb5e80e5911df285f2d1bcaf2cee0d43d79b06fadbcd03c8509ff6854163668c15406')

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
