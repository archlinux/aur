# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=meridian
pkgver=1.27.6
pkgrel=1
pkgdesc="Use your Claude Max subscription with OpenCode, OpenClaw, Pi, Droid, Aider, Crush, Cline."
arch=(any)
url="https://github.com/rynfar/meridian"
license=(MIT)
depends=(nodejs)
makedepends=(bun)
provides=(meridian)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/rynfar/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('8401d90eb6056bc56ab5673b82000a8d8116596bced5f00d6c7047dcb5554da5733334b38221a19d03a7bbe892a2c9d7f49c9c0040588698d7c716ce71cc98d6')

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
