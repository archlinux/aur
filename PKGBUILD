# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgname='paxchange'
pkgdesc='Simple dart script to passively synchronize installed pacman packages between systems.'
pkgver='1.4.3'
pkgrel=1
epoch=2
arch=('x86_64')
url='https://github.com/Skycoder42/paxchange'
license=('BSD')
depends=('pacman')
source=("${pkgname}-${pkgver}-sources.tar.gz::https://github.com/Skycoder42/paxchange/archive/refs/tags/v1.4.3.tar.gz"
        "${pkgname}-${pkgver}-linux.tar.xz::https://github.com/Skycoder42/paxchange/releases/download/v1.4.3/paxchange-1.4.3-linux.tar.xz")
b2sums=('c31469a8906317f5ea76f743201f3d712fa8cc28d9753d6d0105785b9494e893c0725d11ffed767f782326f3ef73d0612e8190da55493254298a18d968fc4cf3'
        '96355383b4f3b6ac003e3b1377b26ce6a0885c87f1c58542c05729327e5d0c7fef0c34a3b167559dd541858a3a037d445657e3c5f255b7d01b28c1b9f60eda20')
install='paxchange.install'
changelog='CHANGELOG.md'
backup=('etc/paxchange.json')
options=('!strip')
_pkgdir='paxchange-1.4.3'

package_paxchange() {
  install -d "$pkgdir/opt/$pkgname"
  cp -a 'paxchange-1.4.3/.' "$pkgdir/opt/$pkgname/"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/"'paxchange' "$pkgdir/usr/bin/"'paxchange'
  cd "$_pkgdir"
  install -D -m644 'deploy/aur/config.json' "$pkgdir/etc/paxchange.json"
  install -D -m644 'deploy/aur/paxchange.hook' "$pkgdir/usr/share/libalpm/hooks/paxchange.hook"
  install -D -m755 'deploy/aur/paxchange-update.sh' "$pkgdir/usr/share/libalpm/scripts/paxchange-update.sh"
  install -D -m644 'deploy/aur/paxchange.sysusers' "$pkgdir/usr/lib/sysusers.d/paxchange.conf"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

