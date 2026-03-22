# Maintainer: noodle <silentnoodle@cock.li>
pkgname=dwarfs-bin
pkgver=0.15.1
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
sha256sums_x86_64=('24453ca3f18e08cde0e323fae4447d2e9f47c65508d8da223d22553e73cafc36')
sha256sums_aarch64=('ff5ef1716dec13082356a23ca8b9a349d00e8af71712cd659d95195202838e5d')
sha256sums_i386=('c91bfe1eb348a8a34581d6377a49c937f18a96a8d1460241fde7f79fe7d3cd47')
sha256sums_loong64=('eaead2ac3c61c6765b80fe57e6c870c7e9f14b83c4947a533aeda0d3720aac7a')
sha256sums_powerpc64=('0a11aff785ae7ebed0aa2f9a0f12e85cb14336901937387e45c4ecc94399b7b6')
sha256sums_powerpc64le=('c70c58a47a81b51bb61fff6f878d9b9e984ac944b704c713b126aaabae9429f6')
sha256sums_riscv64=('7d7af8685ac2527760fa4ca848ded3780a6fc10760242ac789094cd9ee612153')

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
