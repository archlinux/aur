# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='paxchange'
pkgname=('paxchange' 'paxchange-debug')
pkgdesc='Simple dart script to passively synchronize installed pacman packages between systems.'
pkgver='1.4.1'
pkgrel=1
epoch=2
arch=('x86_64')
url='https://github.com/Skycoder42/paxchange'
license=('BSD')
depends=('pacman')
source=("sources.tar.gz::https://github.com/Skycoder42/paxchange/archive/refs/tags/v1.4.1.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/paxchange/releases/download/v1.4.1/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/paxchange/releases/download/v1.4.1/binaries-linux-debug-symbols.tar.xz")
b2sums=('05e611cf50147028ecaa01e235d0529064f0797c4e2699cae47cb113d2ba738e95732e98514bb5e77f373ebf542da96d34837edb5bb865a2682e1f0f5751cb11'
        '846986b4ef3144bd43eb0f204bce527b5a5a9caa5a24aa86c3ee2701432ef3fe3286ca77ba34a845c241a9e155dc0b33936f11ed5d066236f2d0f8a9f211d60e'
        '7e34ab989222d42d48a094dd14de7a10b8f16d0c40697971a74c1731b7b4161a92effa7766052dfafe374f44638a3f37fe88f5259ecbdde9d7c5187fd2cdb08f')
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

