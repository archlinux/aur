pkgname=nff
pkgver=1.0.0
pkgrel=1
pkgdesc="An nftables firewall tool built in Python. Not as robust as direct nftables usage but nice to load static rules similar to ufw"
arch=('any')
url="https://github.com/CodeKing710/nff"
license=('MIT')
depends=('python' 'python-yaml' 'nftables')
backup=('etc/nff.yml' 'etc/nftables.d/00-nff.nft')
install=nff.install
# source=('nff.py' 'nff-defaults.yml' '00-nff.nft' 'version')
source=("v${pkgver}.tar.gz::https://github.com/CodeKing710/nff/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('add1d33042865c362114848b59f7f8a0174037f1f3d7bc63c8adb34a39602d5c')

package() {
  # Create necessary directories
  install -d "$pkgdir/usr/share/nff"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/etc/nff.d"
  install -d "$pkgdir/etc/nftables.d"

  # Install main executable
  install -Dm755 nff.py "$pkgdir/usr/bin/nff"

  # Install configs
  install -Dm644 nff-defaults.yml "$pkgdir/etc/nff.yml"
  install -Dm644 00-nff.nft "$pkgdir/etc/nftables.d/00-nff.nft"

  # Backup defaults to the share
  install -Dm644 nff-defaults.yml "$pkgdir/usr/share/nff/nff-defaults.yml"
  install -Dm644 00-nff.nft "$pkgdir/usr/share/nff/00-nff.nft"

  # Install Misc data
  install -Dm644 version "$pkgdir/usr/share/nff/version"
}
