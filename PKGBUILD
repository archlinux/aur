# Maintainer: Tiago Correia
#
# AUR package with the static binaries of the GitHub release. scripts/aur.sh
# fills in pkgver and the checksums from the release's SHA256SUMS and writes
# .SRCINFO; see docs/RELEASE.md.
pkgname=virsh-tui-bin
_pkgname=virsh-tui
pkgver=0.3.1
pkgrel=1
pkgdesc="Keyboard-driven terminal UI for libvirt/virsh with vim keys and live graphs (static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/SyscallBrain/virsh-tui"
license=('MIT')
depends=('libvirt')
optdepends=('virt-install: the new domain wizard'
            'virt-viewer: the graphical viewer')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('6be33c058260ac0d186ad0a49e22663c8351ca87a30a204253cc244905d3051a')
sha256sums_aarch64=('e91ee879d5f3c47a11383c02ec8eb9c6d44efd1e78560779b537d583ee1332c7')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 virsh-tui "$pkgdir/usr/bin/virsh-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
