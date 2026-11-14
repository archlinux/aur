# Maintainer: Tiago Correia
#
# AUR package with the static binaries of the GitHub release. scripts/aur.sh
# fills in pkgver and the checksums from the release's SHA256SUMS and writes
# .SRCINFO; see docs/RELEASE.md.
pkgname=virsh-tui-bin
_pkgname=virsh-tui
pkgver=0.3.0
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
sha256sums_x86_64=('9dccc9a2eb4e34daf5bfae870862c3e734f98f31e0aee48d4f5a44f2dd97eee5')
sha256sums_aarch64=('21bae3f24347885a9c9319dfbb1e782118c144b6b91958dd13afa9b8d706d8f9')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 virsh-tui "$pkgdir/usr/bin/virsh-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
