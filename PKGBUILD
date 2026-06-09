pkgname=greptile-cli
pkgver=3.0.7
pkgrel=1
pkgdesc="Greptile code review from your terminal"
arch=('any')
url="https://greptile.com"
license=('MIT')
depends=('nodejs>=22')
makedepends=('bun')
source=("https://registry.npmjs.org/greptile/-/greptile-${pkgver}.tgz")
noextract=("greptile-${pkgver}.tgz")
sha256sums=('55565fd7b981b6af5937caca844ccd7c1ce8c7332c7f691c7f750884699a4de0')

package() {
  BUN_INSTALL="${pkgdir}/usr" bun install -g "greptile@${pkgver}"
  # bun gives world-writable permissions to some directories, fix them
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  # Fix potential ownership issues
  chown -R root:root "${pkgdir}/usr"
}