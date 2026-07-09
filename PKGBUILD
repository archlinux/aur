# Maintainer: noodle <silentnoodle@cock.li>
pkgname=dwarfs-bin
pkgver=0.15.4
pkgrel=1
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
sha256sums_x86_64=('86bcef95c050f21ab88878b2d8f33344698d9b3a3e83ecf30b10fa35225617d1')
sha256sums_aarch64=('708ea9d9b20f246e043f8dbb3652272c1465ec1336db7e4881c7acb961e159c8')
sha256sums_i386=('7f9b2c7f8e0648a0ec5533366c57a679eb836d11c1551484c18fa9f49e60e9cb')
sha256sums_loong64=('f20a496fcf3afa335a5d504657df588d06ec8647708cb793f0c87df0dd6599b7')
sha256sums_powerpc64=('cc1c93976093dae499d1a574c57d851642e5a2b3cb2923ec415e4a8d81118df0')
sha256sums_powerpc64le=('43f8cfef1c5632f35e63344c0b292cc9d603a4b70ef8f120e223c22163e14ffa')
sha256sums_riscv64=('a10ee68bcdfc2bd5508552315d36032087bbc64330dc8006cda90e4d95802389')

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

  install -Dm644 share/bash-completion/completions/dwarfs "$pkgdir/usr/share/bash-completion/completions/dwarfs"
  install -Dm644 share/bash-completion/completions/dwarfsck "$pkgdir/usr/share/bash-completion/completions/dwarfsck"
  install -Dm644 share/bash-completion/completions/dwarfsextract "$pkgdir/usr/share/bash-completion/completions/dwarfsextract"
  install -Dm644 share/bash-completion/completions/mkdwarfs "$pkgdir/usr/share/bash-completion/completions/mkdwarfs"

  install -Dm644 share/zsh/site-functions/_dwarfs "$pkgdir/usr/share/zsh/site-functions/_dwarfs"
  install -Dm644 share/zsh/site-functions/_dwarfsck "$pkgdir/usr/share/zsh/site-functions/_dwarfsck"
  install -Dm644 share/zsh/site-functions/_dwarfsextract "$pkgdir/usr/share/zsh/site-functions/_dwarfsextract"
  install -Dm644 share/zsh/site-functions/_mkdwarfs "$pkgdir/usr/share/zsh/site-functions/_mkdwarfs"
  
  install -Dm644 share/mime/packages/dwarfs.xml "$pkgdir/usr/share/mime/packages/dwarfs.xml"
}
