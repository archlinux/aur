# Maintainer: Ahmet Altindis
pkgname=wipsync-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Sync work-in-progress folders between machines, through restic and ssh"
arch=(x86_64)
url="https://github.com/ahaltindis/wipsync"
license=(MIT)
depends=('restic>=0.17.1' openssh)
optdepends=('git: tell a refreshed git index from a real change'
            'libnotify: desktop notifications from the service')
provides=(wipsync)
conflicts=(wipsync)
options=(!debug)
install=wipsync.install
source=("wipsync-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/wipsync-$pkgver-x86_64.tar.gz")
sha256sums=('425ec82ba4940407d5c8738fb6cb452dfa2b5e35f9a28cdf289fd8a6460ea59e')

package() {
  cd "wipsync-$pkgver-x86_64"
  install -Dm755 wipsync "$pkgdir/usr/bin/wipsync"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 wipsync.service "$pkgdir/usr/lib/systemd/user/wipsync.service"
  install -Dm644 completions/wipsync.bash "$pkgdir/usr/share/bash-completion/completions/wipsync"
  install -Dm644 completions/_wipsync "$pkgdir/usr/share/zsh/site-functions/_wipsync"
  install -Dm644 completions/wipsync.fish "$pkgdir/usr/share/fish/vendor_completions.d/wipsync.fish"
}
