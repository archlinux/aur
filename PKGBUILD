# Maintainer: noodle <silentnoodle@cock.li>
pkgname=dwarfs-bin
pkgver=0.15.2
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
sha256sums_x86_64=('ad9ef4edf2d124b5c8d4540b2298a9b520e15841c68b921192d9bcb83eb69455')
sha256sums_aarch64=('f81290d5c4890a274a60a82b801e62110975ca466799e4408ad046bc70695aef')
sha256sums_i386=('fd6ed59b7805539c6fc6e6e508344d10479f6587abe1040a1e86997f19b52fa0')
sha256sums_loong64=('62f5f2bac65232184cb14e7bb7921a38b34440dcd688080eebdcdc512915d3ba')
sha256sums_powerpc64=('1668eca05412c2bd848ad4aa606a61fb2bf48f3cf92aac556149778a713885f2')
sha256sums_powerpc64le=('08e556adeb248a20aec04bf70886146f5e56bd0efc0bbe225aae69d20b25d33e')
sha256sums_riscv64=('3110c8f630a4ae65fe16e4e3280f74d34b2c7a8224630e03361ed799819eeb9f')

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
