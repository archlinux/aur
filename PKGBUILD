# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='paxchange'
pkgname=('paxchange' 'paxchange-debug')
pkgdesc='Simple dart script to passively synchronize installed pacman packages between systems.'
pkgver='1.2.5'
pkgrel=1
epoch=2
arch=('x86_64')
url='https://github.com/Skycoder42/paxchange'
license=('BSD')
depends=('pacman')
_pkgdir='paxchange-1.2.5'
source=("$_pkgdir.tar.gz::https://github.com/Skycoder42/paxchange/archive/refs/tags/v1.2.5.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/paxchange/releases/download/v1.2.5/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/paxchange/releases/download/v1.2.5/binaries-linux-debug-symbols.tar.xz")
b2sums=('83c4ab9488cb7a2b93849542eeb54d87984eba144b37633cdfd840ad885cdb6a389ae85c08a57c518bc4ecd5b3579e978c8baaad2fce598fae74f5bd02aeeb51'
        '7ec13e92f59172ccf95f1cab993f20f82203fd325f2dc698c0f9f42b10e29d00badfe0f51d84d26b958737544f4fc882257a06400f6b43bb79dd080bf08158ca'
        'dd38353152a5a143171de1877e4b21e5809e9a9f10727ca3687e2e6980c90db2f34406268da6c580a268054c6513b6dcc45dd0bb366530d68babaa69c29dfdb2')
install='paxchange.install'
changelog='CHANGELOG.md'
backup=('etc/paxchange.json')
options=('!strip')

package_paxchange() {
  cd "$_pkgdir"
  install -D -m755 '../paxchange' "$pkgdir/usr/bin/"'paxchange'
  install -D -m644 'deploy/aur/config.json' "$pkgdir/etc/paxchange.json"
  install -D -m644 'deploy/aur/paxchange.hook' "$pkgdir/usr/share/libalpm/hooks/paxchange.hook"
  install -D -m644 'deploy/aur/paxchange.sysusers' "$pkgdir/usr/lib/sysusers.d/paxchange.conf"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

package_paxchange-debug() {
  cd "$_pkgdir"
  install -D -m644 '../paxchange.sym' "$pkgdir/usr/lib/debug/usr/bin/"'paxchange'.sym
  find . -exec install -D -m644 "{}" "$pkgdir/usr/src/debug/$pkgname/{}" \;
}

