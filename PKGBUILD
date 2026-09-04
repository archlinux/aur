# Maintainer: pineappletoad

pkgname=can-utils-bin
pkgver=2025.01
_pkgrel_src=3
pkgrel=1
pkgdesc="Linux-CAN / SocketCAN user space applications (precompiled)"
arch=('x86_64' 'armv7h')
url="https://github.com/linux-can/can-utils"
license=('GPL-2.0-only')
options=('!debug')
provides=('can-utils')
conflicts=('can-utils' 'can-utils-git')

# x86_64: a full pacman package built natively (via aur-bin-chicken), re-extracted.
# armv7h: a plain tarball of a cross-compiled install tree (arm-linux-gnueabihf-*-bin
# toolchain, built in CI on an x86_64 runner) for the BeagleBone Black - no native
# build happens on armv7h at all, this is purely a repackaging step there too.
source_x86_64=("https://github.com/tubbywrestler/can-utils-bin/releases/download/${pkgver}-${_pkgrel_src}/can-utils-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst")
sha256sums_x86_64=('c04e77240c53ab0ae82eb06f4238f87340180d225754faf5c2c680a1eb099f58')
source_armv7h=("https://github.com/tubbywrestler/can-utils-bin/releases/download/${pkgver}-${_pkgrel_src}-armv7h/can-utils-${pkgver}-${_pkgrel_src}-armv7h.tar.zst")
sha256sums_armv7h=('064b7b8063954af13cc4a076430e5643fc8bb97e73e1126372f7e1d9e614fcb0')

package() {
    if [ "${CARCH}" = "armv7h" ]; then
        cp -a "${srcdir}/usr" "${pkgdir}/"
    else
        bsdtar -xf "${srcdir}/can-utils-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
    fi
}
