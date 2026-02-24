pkgname=linux-rvkernel-bore-clang
pkgver=6.19.3
pkgrel=1
pkgdesc="RvKernel Linux is a custom Linux kernel, a fork of CachyOS kernel"
arch=('x86_64')
url="https://github.com/Rve27/RvKernel-Linux"
license=('GPL-2.0-only')
source=(
  "https://github.com/Rve27/RvKernel-Linux/releases/download/${pkgver}/linux-rvkernel-bore-lto-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst"
)
noextract=(
  "linux-rvkernel-bore-lto-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst"
)
sha256sums=('6144618892ed082fecc592ef75df6497e8bde894f9fb6362fcf5f41699593d2d')

package() {
  pkgdesc="RvKernel Linux kernel and modules"
  depends=('coreutils' 'kmod' 'initramfs')
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed for some devices'
    'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig'
    'scx-scheds: to use sched-ext schedulers'
  )
  provides=(
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
    KSMBD-MODULE
    V4L2LOOPBACK-MODULE
    NTSYNC-MODULE
    VHBA-MODULE
    ADIOS-MODULE
  )

  cd "${srcdir}"
  bsdtar -xf "linux-rvkernel-bore-lto-${pkgver}-${pkgrel}-${arch[0]}.pkg.tar.zst" -C "${pkgdir}"

  rm -f "${pkgdir}"/{.BUILDINFO,.MTREE,.PKGINFO}
}
