# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='paxchange'
pkgdesc='Simple dart script to passively synchronize installed pacman packages between systems.'
pkgver='1.4.4'
pkgrel=1
epoch=2
arch=('x86_64')
url='https://github.com/Skycoder42/paxchange'
license=('BSD')
depends=('pacman')
source=("${pkgname}-${pkgver}-sources.tar.gz::https://github.com/Skycoder42/paxchange/archive/refs/tags/v1.4.4.tar.gz"
        "${pkgname}-${pkgver}-linux.tar.xz::https://github.com/Skycoder42/paxchange/releases/download/v1.4.4/paxchange-1.4.4-linux.tar.xz")
b2sums=('88c38a9b2b3be11251f4f9e29c6671909f098f82410330d7ee42c33fc5d73f6589b2b023669ebb5dcdf585b2dbf8ae955393279edb6e8a754976362928772cd2'
        '982ad68e6f8bb355019f37b0deb955b96354402f8180248c1a1c427bb345aaa71682f9a9c20b6bea590317b82e0b7e83d8fba2eb2759610ff8f8515c0199eef7')
install='paxchange.install'
changelog='CHANGELOG.md'
backup=('etc/paxchange.json')
options=('!strip')
_pkgdir='paxchange-1.4.4'

package_paxchange() {
  install -d "$pkgdir/opt/$pkgname"
  cp -a 'paxchange-1.4.4/.' "$pkgdir/opt/$pkgname/"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/"'paxchange' "$pkgdir/usr/bin/"'paxchange'
  cd "$_pkgdir"
  install -D -m644 'deploy/aur/config.json' "$pkgdir/etc/paxchange.json"
  install -D -m644 'deploy/aur/paxchange.hook' "$pkgdir/usr/share/libalpm/hooks/paxchange.hook"
  install -D -m755 'deploy/aur/paxchange-update.sh' "$pkgdir/usr/share/libalpm/scripts/paxchange-update.sh"
  install -D -m644 'deploy/aur/paxchange.sysusers' "$pkgdir/usr/lib/sysusers.d/paxchange.conf"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

