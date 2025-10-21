# Maintainer: noodle <silentnoodle@cock.li>
pkgname=dwarfs-bin
pkgver=0.14.0
pkgrel=2
pkgdesc='A fast high compression read-only file system (pre-compiled binaries)'
url='https://github.com/mhx/dwarfs'
source_x86_64=("dwarfs-${pkgver}-Linux-x86_64.tar.xz::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}-Linux-x86_64.tar.xz")
source_aarch64=("dwarfs-${pkgver}-Linux-aarch64.tar.xz::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}-Linux-aarch64.tar.xz")
source_i386=("dwarfs-${pkgver}-Linux-i386.tar.xz::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}-Linux-i386.tar.xz")
source_loong64=("dwarfs-${pkgver}-Linux-loong64.tar.xz::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}-Linux-loongarch64.tar.xz")
source_powerpc64=("dwarfs-${pkgver}-Linux-powerpc64.tar.xz::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}-Linux-ppc64.tar.xz")
source_powerpc64le=("dwarfs-${pkgver}-Linux-powerpc64le.tar.xz::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}-Linux-ppc64le.tar.xz")
source_riscv64=("dwarfs-${pkgver}-Linux-riscv64.tar.xz::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}-Linux-riscv64.tar.xz")
arch=('x86_64' 'aarch64' 'i386' 'loong64' 'powerpc64' 'powerpc64le' 'riscv64')
license=('GPL3 AND MIT')
depends=(
  'fuse3'
)
conflicts=('dwarfs')
provides=('dwarfs')
sha256sums_x86_64=('2b253aec82243437a7913e8a878944d96a7ab308a3861d59ce41aaa15e1409ad')
sha256sums_aarch64=('ad4c9f31bf292d9a684add611c954f20b9aae698beae9d1a1144e3f9da4e8521')
sha256sums_i386=('f006e7c2c0d527a3d40cbcdbdbbe339225dc2e0844abba862e684f8c1b79a8db')
sha256sums_loong64=('4b81e7476eb6286c53137cf6ecd955aec534fb458e983baddfd8a384b064107b')
sha256sums_powerpc64=('36fd97fd8b36703c416dbe8f24e1642339392bc7134a9f39b3962b84afd6785e')
sha256sums_powerpc64le=('f4150d897e689dc755233050f948d4c73de426311dee45ca8eed453f678e7e57')
sha256sums_riscv64=('ff3507cfe450fc2e0c04437901d164d21d322ce0540ef1251be70fbb96c5f557')

package() {
  case "$CARCH" in
    powerpc64) up_arch="ppc64" ;;
    powerpc64le) up_arch="ppc64le" ;;
    loong64) up_arch="loongarch64" ;;
    *) up_arch="$CARCH" ;;
  esac

  cd "${srcdir}/dwarfs-${pkgver}-Linux-${up_arch}"

  install -Dm755 bin/dwarfsck "${pkgdir}/usr/bin/dwarfsck"
  install -Dm755 bin/dwarfsextract "${pkgdir}/usr/bin/dwarfsextract"
  install -Dm755 bin/mkdwarfs "${pkgdir}/usr/bin/mkdwarfs"
  install -Dm755 bin/dwarfs "${pkgdir}/usr/bin/dwarfs"
  ln -s dwarfs "${pkgdir}/usr/bin/mount.dwarfs"
  # install dwarfs2 only if it exists (not present in all architectures)
  [ -f sbin/dwarfs2 ] && {
    install -Dm755 bin/dwarfs2 "${pkgdir}/usr/bin/dwarfs2"
    ln -s dwarfs2 "${pkgdir}/usr/bin/mount.dwarfs2"
  }
  install -Dm755 bin/pxattr "${pkgdir}/usr/bin/pxattr"
  
  install -Dm644 share/applications/dwarfs-mount-handler.desktop "$pkgdir/usr/share/applications/dwarfs-mount-handler.desktop"

  install -Dm644 share/man/man1/dwarfs.1 "$pkgdir/usr/share/man/man1/dwarfs.1"
  install -Dm644 share/man/man1/dwarfsck.1 "$pkgdir/usr/share/man/man1/dwarfsck.1"
  install -Dm644 share/man/man1/dwarfsextract.1 "$pkgdir/usr/share/man/man1/dwarfsextract.1"
  install -Dm644 share/man/man1/mkdwarfs.1 "$pkgdir/usr/share/man/man1/mkdwarfs.1"
  install -Dm644 share/man/man5/dwarfs-format.5 "$pkgdir/usr/share/man/man5/dwarfs-format.5"
  install -Dm644 share/man/man7/dwarfs-env.7 "$pkgdir/usr/share/man/man7/dwarfs-env.7"

  install -Dm644 share/bash-completion/completions/_mkdwarfs "$pkgdir/usr/share/bash-completion/completions/mkdwarfs"
  install -Dm644 share/mime/packages/dwarfs.xml "$pkgdir/usr/share/mime/packages/dwarfs.xml"
  install -Dm644 share/zsh/site-functions/_mkdwarfs "$pkgdir/usr/share/zsh/site-functions/_mkdwarfs"
}
