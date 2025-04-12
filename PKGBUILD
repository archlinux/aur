# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='paxchange'
pkgname=('paxchange' 'paxchange-debug')
pkgdesc='Simple dart script to passively synchronize installed pacman packages between systems.'
pkgver='1.3.0'
pkgrel=1
epoch=2
arch=('x86_64')
url='https://github.com/Skycoder42/paxchange'
license=('BSD')
depends=('pacman')
source=("sources.tar.gz::https://github.com/Skycoder42/paxchange/archive/refs/tags/v1.3.0.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/paxchange/releases/download/v1.3.0/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/paxchange/releases/download/v1.3.0/binaries-linux-debug-symbols.tar.xz")
b2sums=('5bb1095beb4215a0e2b3ee806d371d1a1bdade884b992ce534320834ec2354da726f454fd11d355ce9db92adc40aee3b004c350cee57ce184b38755f77994bcc'
        'c12704e2bf28764f482ac71318424498b75319a5c0af580006c452396af89b937745cf5b4ea1295c496bbcc63f30538e6c25b74e9f97394fdd8cff62ef38563b'
        '50bd705eb399e5f5fffbcc2a2f0e5767de9efd718a374102d94f4b0fd55b1dc1d2e475c526c5781d034baab3f1d654a949c5fba509823251120ec17b8d2cb08a')
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

