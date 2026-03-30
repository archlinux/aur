# Maintainer: Miguel Revilla Rodríguez <migrev at gmail dot com>
pkgname=gga
pkgver=2.8.1
pkgrel=1
pkgdesc="Provider-agnostic code review using AI - Validate code against your AGENTS.md"
arch=('any')
url="https://github.com/Gentleman-Programming/gentleman-guardian-angel"
license=('MIT')
depends=('bash' 'git' 'curl')
optdepends=(
  'shellspec: for running test suite'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gentleman-Programming/gentleman-guardian-angel/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1be109ba7e60cecbf47cb4142717aca7bb7b3b651ef0d3d42c0b9d923e71ae2')

package() {
  cd "$srcdir/gentleman-guardian-angel-$pkgver"
  
  # Main binary with updated LIB_DIR
  install -Dm755 "bin/gga" "$pkgdir/usr/bin/gga"
  sed -i "s|LIB_DIR=.*|LIB_DIR=\"/usr/share/gga/lib\"|" "$pkgdir/usr/bin/gga"
  sed -i "s|VERSION=\"\${GGA_VERSION:-dev}\"|VERSION=\"$pkgver\"|" "$pkgdir/usr/bin/gga"
  
  # Libraries
  install -Dm644 "lib/providers.sh" "$pkgdir/usr/share/gga/lib/providers.sh"
  install -Dm644 "lib/cache.sh" "$pkgdir/usr/share/gga/lib/cache.sh"
  install -Dm644 "lib/pr_mode.sh" "$pkgdir/usr/share/gga/lib/pr_mode.sh"
  
  # Documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/gga/README.md"
  install -Dm644 "CONTRIBUTING.md" "$pkgdir/usr/share/doc/gga/CONTRIBUTING.md"
  install -Dm644 "AGENTS.md" "$pkgdir/usr/share/doc/gga/AGENTS.md.example"
  install -Dm644 "docs/caching.md" "$pkgdir/usr/share/doc/gga/docs/caching.md"
  install -Dm644 "docs/changelog.md" "$pkgdir/usr/share/doc/gga/docs/changelog.md"
  install -Dm644 "docs/commands.md" "$pkgdir/usr/share/doc/gga/docs/commands.md"
  install -Dm644 "docs/configuration.md" "$pkgdir/usr/share/doc/gga/docs/configuration.md"
  install -Dm644 "docs/examples.md" "$pkgdir/usr/share/doc/gga/docs/examples.md"
  install -Dm644 "docs/integrations.md" "$pkgdir/usr/share/doc/gga/docs/integrations.md"
  install -Dm644 "docs/providers.md" "$pkgdir/usr/share/doc/gga/docs/providers.md"
  install -Dm644 "docs/rules-file.md" "$pkgdir/usr/share/doc/gga/docs/rules-file.md"
  install -Dm644 "docs/troubleshooting.md" "$pkgdir/usr/share/doc/gga/docs/troubleshooting.md"
  
  # License
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/gga/LICENSE"
}
