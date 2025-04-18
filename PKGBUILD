# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='paxchange'
pkgname=('paxchange' 'paxchange-debug')
pkgdesc='Simple dart script to passively synchronize installed pacman packages between systems.'
pkgver='1.4.0'
pkgrel=1
epoch=2
arch=('x86_64')
url='https://github.com/Skycoder42/paxchange'
license=('BSD')
depends=('pacman')
source=("sources.tar.gz::https://github.com/Skycoder42/paxchange/archive/refs/tags/v1.4.0.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/paxchange/releases/download/v1.4.0/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/paxchange/releases/download/v1.4.0/binaries-linux-debug-symbols.tar.xz")
b2sums=('055bc309b2d32823de2e6bd98c8c940886cb5ee1c71dbc7c6bca94fa4a2b32b45cca2c61ae84cb0c9582c533c013ad7f4661fa8c96f3b3194bab62377ea5156d'
        '3778bea8d1460b38155f28508c8e090f4b603bbd035b1a6923ae3904064f72d74478079a2c11fbfef089e23040169a2583a878c113a7ddc3f60a8ad82d0c9ab2'
        '2c296466bf7df21cdaecb81cd27482a2974cf51272eb06284d05631d8cce06cbcf6e2de050c1ebfa0778c974058d983258ec17da5f1fd1b32aebed74efd9b540')
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

