# Maintainer: Solara Linux <ash8820@proton.me>

pkgname=solara-kernel
pkgver=7.0.1
pkgrel=2
pkgdesc="Solara Linux Kernel - CachyOS optimized, Solara branded"
arch=('x86_64')
url="https://github.com/ravecorelabs/solara"
license=('GPL2')
depends=('coreutils' 'kmod' 'initramfs')
optdepends=('wireless-regdb' 'linux-firmware' 'modprobed-db' 'scx-sched')

source=("https://share.cachyos.org/x86_64_v3/kernel/7.0/linux-cachyos-${pkgver}-${pkgrel}-x86_64_v3.pkg.tar.zst")
sha256sums=('SKIP')

package() {
    tar -xf "${srcdir}/linux-cachyos-${pkgver}-${pkgrel}-x86_64_v3.pkg.tar.zst" -C "${pkgdir}"
    
    for f in "${pkgdir}"/boot/vmlinuz-*; do
        [ -f "$f" ] && mv "$f" "${f/-cachyos/-solara}"
    done
    
    for d in "${pkgdir}"/usr/lib/modules/*; do
        [ -d "$d" ] && mv "$d" "${d/-cachyos/-solara}"
    done
    
    sed -i 's/linux-cachyos/solara-kernel/g' "${pkgdir}"/usr/lib/modprobe.d/*.conf 2>/dev/null || true
}