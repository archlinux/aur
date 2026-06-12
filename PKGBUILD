pkgname=greptile-cli
pkgver=3.1.0
pkgrel=1
pkgdesc="Greptile code review from your terminal"
arch=('any')
url="https://greptile.com"
license=('MIT')
depends=('nodejs>=22')
makedepends=('bun')
source=("https://registry.npmjs.org/greptile/-/greptile-${pkgver}.tgz")
noextract=("greptile-${pkgver}.tgz")
sha256sums=('d2ed3b13dc51a322bfa620c003a14ea160a6f27c86dcfefb559d76e82801ea4e')

package() {
  BUN_INSTALL="${pkgdir}/usr" bun install -g "greptile@${pkgver}"
  # bun gives world-writable permissions to some directories, fix them
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  # Fix potential ownership issues
  chown -R root:root "${pkgdir}/usr"
}