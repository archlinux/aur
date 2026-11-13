# Maintainer: Tiago Correia
#
# AUR package with the static binaries of the GitHub release. scripts/aur.sh
# fills in pkgver and the checksums from the release's SHA256SUMS and writes
# .SRCINFO; see docs/RELEASE.md.
pkgname=virsh-tui-bin
_pkgname=virsh-tui
pkgver=0.2.0
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
sha256sums_x86_64=('aa1537800fbcae6765b27ce22d09ea14338f4fcf22b56f95b25dcd9012fb7251')
sha256sums_aarch64=('de4c73e8d304865622daef67f24c356fac9e13aaf1a2baa9d92883ea39a1ac00')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 virsh-tui "$pkgdir/usr/bin/virsh-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
