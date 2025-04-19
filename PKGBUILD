# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='paxchange'
pkgname=('paxchange' 'paxchange-debug')
pkgdesc='Simple dart script to passively synchronize installed pacman packages between systems.'
pkgver='1.4.2'
pkgrel=1
epoch=2
arch=('x86_64')
url='https://github.com/Skycoder42/paxchange'
license=('BSD')
depends=('pacman')
source=("sources.tar.gz::https://github.com/Skycoder42/paxchange/archive/refs/tags/v1.4.2.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/paxchange/releases/download/v1.4.2/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/paxchange/releases/download/v1.4.2/binaries-linux-debug-symbols.tar.xz")
b2sums=('27298ac9ff8ce03ad3a9aba0481fa2bcdad4350df1744480f6e8906170170f6a6ebe978111e0cf7fc1f47f752f2a89526379f688340f3d09d7219b6009704e37'
        'a91c429b031698705d1d008acbec641f6ab6d83b30105af94a5642207c26cebd1db02887210803247b0ceb0d9ec9317fac293ccc5de3083c3e6d8ce288f57515'
        'bb73fec1a12c22c33a4cf16e6888ec4acbf95ae7199b909558dfe62f11abf695ea25893cbbed86d4a637eb4110d7864b816cb76fc66a4a18e062b39782b2206b')
install='paxchange.install'
changelog='CHANGELOG.md'
backup=('etc/paxchange.json')
options=('!strip')
_pkgdir="$pkgbase-$pkgver"

package_paxchange() {
  install -D -m755 'paxchange' "$pkgdir/usr/bin/"'paxchange'
  cd "$_pkgdir"
  install -D -m644 'deploy/aur/config.json' "$pkgdir/etc/paxchange.json"
  install -D -m644 'deploy/aur/paxchange.hook' "$pkgdir/usr/share/libalpm/hooks/paxchange.hook"
  install -D -m755 'deploy/aur/paxchange-update.sh' "$pkgdir/usr/share/libalpm/scripts/paxchange-update.sh"
  install -D -m644 'deploy/aur/paxchange.sysusers' "$pkgdir/usr/lib/sysusers.d/paxchange.conf"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

package_paxchange-debug() {
  install -D -m644 'paxchange.sym' "$pkgdir/usr/lib/debug/usr/bin/"'paxchange'.sym
  cd "$_pkgdir"
  find . -exec install -D -m644 "{}" "$pkgdir/usr/src/debug/$pkgbase/{}" \;
}

