# Maintainer: Admin12121
pkgname=decompile
pkgver=0.1.0
pkgrel=1
pkgdesc='Docker-isolated static reverse engineering orchestrator'
arch=('any')
url='https://github.com/Admin12121/decompile'
license=('unknown')
depends=('python' 'docker')
optdepends=('github-cli: passes GitHub authentication for optional AI enhancement')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 decompile "${pkgdir}/usr/bin/decompile"
  install -dm755 "${pkgdir}/usr/share/decompile"
  cp -a decompile_tool "${pkgdir}/usr/share/decompile/decompile_tool"

  find "${pkgdir}/usr/share/decompile/decompile_tool" -type d -exec chmod 0755 {} +
  find "${pkgdir}/usr/share/decompile/decompile_tool" -type f -exec chmod 0644 {} +
  chmod 0755 "${pkgdir}/usr/share/decompile/decompile_tool/cli.py"
  chmod 0755 "${pkgdir}/usr/share/decompile/decompile_tool/enhance_with_copilot"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/decompile/README.md"
}
