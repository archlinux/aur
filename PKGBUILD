# Maintainer: Mark Roboff <mark.roboff@bluecircuit.ai>
pkgname=vm-curator-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A TUI application to manage QEMU/KVM VMs (pre-built binary)"
arch=('x86_64')
url="https://github.com/mroboff/vm-curator"
license=('MIT')
# qemu-desktop (not qemu-base): qemu-base is the headless build with no GTK/SDL/
# SPICE display or audio modules, which leaves VMs unable to open a window.
depends=('gcc-libs' 'systemd-libs' 'qemu-desktop')
optdepends=(
    'edk2-ovmf: UEFI boot support'
    'swtpm: TPM 2.0 emulation for Windows 11'
    'passt: fast user-mode networking'
    'virt-viewer: SPICE display (spice-app)'
    'dnsmasq: DHCP for managed virtual networks'
    'samba: SMB-mode shared folders for Windows guests'
    'polkit: privilege escalation for PCI/bridge setup'
    'qemu-system-arm: ARM/AArch64 VM support'
    'qemu-system-ppc: PowerPC VM support'
    'qemu-system-m68k: m68k (classic Mac) VM support'
)
provides=('vm-curator')
conflicts=('vm-curator')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mroboff/vm-curator/releases/download/v$pkgver/vm-curator-v$pkgver-linux-x86_64.tar.gz")
sha256sums=('5a0db8a3c30fe36ba4247f3eb3cb2079eb33c02314baa443724d2add1575c016')

package() {
    install -Dm755 "vm-curator" "$pkgdir/usr/bin/vm-curator"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
