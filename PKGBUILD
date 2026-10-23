# Maintainer: Marco Ziliani (rylos)
pkgname=abb-agent-bin
_pkgname=abb-agent
pkgver=0.2.8
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
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz"
               "$_pkgname-$pkgver-x86_64.tar.gz.asc::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz.asc")
sha256sums_x86_64=('3c0c73fd8095b322f71a227f6e69e448c5f9c1f52fc8e61a7016a7decfeecbaa' 'SKIP')
# Release signing key: https://github.com/rylos.gpg
validpgpkeys=('B903BF2CD82C9EA45C9FB35DE2E8944F09676A61')

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
