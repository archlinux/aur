# Maintainer: noodle <silentnoodle@cock.li>
pkgname=dwarfs-bin
pkgver=0.15.5
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
sha256sums_x86_64=('2444fbf7d1c4c0af5417d6c26ab3d0537f43da2fbc721ecce60eae6547ba991b')
sha256sums_aarch64=('8e1c1cc976ac6681d9adad5cca0ed0df572cfe5adbc103f2c18c1a3d19fae1cf')
sha256sums_i386=('87671848839fb3fe183abf03c4616eec98f05b74b81d855b03e26071283bdb4a')
sha256sums_loong64=('7b2de81e48f24e12eb325e7647b959c26e1a74e3fd208adbb6c960fda3482f43')
sha256sums_powerpc64=('5da2f0ffacd751f2545d1848d76c96d2b33336aa84ef15c54f1301c7bf99cbed')
sha256sums_powerpc64le=('1e6d26f14db7b8f8538cc96d0ff18fd214045d743422e5d7238b33dcf3b8ed7a')
sha256sums_riscv64=('bc1a2460da5699cb33b8cf44ac7aef61b1db90a3bef90104955d8bc2f6507dd5')

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
