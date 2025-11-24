pkgname=rice-switcher
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool for switching and managing RICE themes for your desktop"
arch=('any')
url="https://github.com/S1rEx1/Rice-Switcher"
license=('GPL')
depends=('bash' 'fzf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/S1rEx1/Rice-Switcher/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "Rice-Switcher-main"
  sed -i 's|source "$SCRIPT_DIR/lib/|source "/usr/lib/rice-switcher/|g' config_switcher.sh
  sed -i 's|CONFIG_FILE=".*"|CONFIG_FILE="/usr/share/rice-switcher/config.json"|g' lib/config.sh
}

package() {
  cd "Rice-Switcher-main"
  install -Dm755 config_switcher.sh "$pkgdir/usr/bin/rice-switcher"
  install -dm755 "$pkgdir/usr/lib/rice-switcher/"
  install -Dm755 lib/*.sh "$pkgdir/usr/lib/rice-switcher/"
  install -Dm644 config.json "$pkgdir/usr/share/rice-switcher/config.json"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
