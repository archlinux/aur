# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=meridian
pkgver=1.29.1
pkgrel=1
pkgdesc="Use your Claude Max subscription with OpenCode, OpenClaw, Pi, Droid, Aider, Crush, Cline."
arch=(any)
url="https://github.com/rynfar/meridian"
license=(MIT)
depends=(nodejs)
makedepends=(bun)
provides=(meridian)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/rynfar/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('9baa9e0ef17f3377ed1544c237d8b2e70c362190f1b76ce6eb1d0b1a12937ebe58e590f823e96715a3b906748add01470416bee590dc0dd3c90521dcbf7d22a3')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  bun install
  bun run build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a dist node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/${pkgname}/dist/cli.js" "$pkgdir/usr/bin/${pkgname}"
}
