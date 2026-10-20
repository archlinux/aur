# Maintainer: Marco Ziliani (rylos)
pkgname=abb-agent-bin
_pkgname=abb-agent
pkgver=0.1.0
pkgrel=1
pkgdesc="Replacement for the Synology Active Backup for Business Linux agent: any distro and kernel, first-class btrfs, bare-metal restore (https://github.com/rylos/abb-agent)"
arch=('x86_64')
url="https://github.com/rylos/abb-agent"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
backup=('etc/abb-agent.toml')
install=abb-agent.install
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums_x86_64=('dca2f424ba69c440d50378da9c9127c177bf0d06b848b4785beb657bae370829')

package() {
  cd "$_pkgname-$pkgver-$CARCH"
  install -Dm755 abb-agent "$pkgdir/usr/bin/abb-agent"
  install -Dm755 abb-restore "$pkgdir/usr/bin/abb-restore"
  install -Dm644 abb-agent.service "$pkgdir/usr/lib/systemd/system/abb-agent.service"
  install -Dm644 abb-agent-fixup.service "$pkgdir/usr/lib/systemd/system/abb-agent-fixup.service"
  install -Dm644 abb-agent.toml "$pkgdir/etc/abb-agent.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
