# Maintainer: noodle <silentnoodle@cock.li>
pkgname=dwarfs-bin
pkgver=0.7.3
pkgrel=1
pkgdesc='A fast high compression read-only file system (pre-compiled binaries)'
url='https://github.com/mhx/dwarfs'
source_x86_64=("dwarfs-${pkgver}-Linux-x86_64.tar.xz::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}-Linux-x86_64.tar.xz")
source_aarch64=("dwarfs-${pkgver}-Linux-aarch64.tar.xz::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}-Linux-aarch64.tar.xz")
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=(
  'fuse3' 'openssl' 'boost-libs' 'jemalloc' 'xxhash'
  'lz4' 'xz' 'zstd' 'libarchive'
  'libunwind' 'google-glog' 'fmt' 'gflags' 'double-conversion'
)
conflicts=('dwarfs')
provides=('dwarfs')
sha256sums_x86_64=('f625b717c34fe778012fb94e17bccbffe52b60ba4060146f48f43c49e11345fd')
sha256sums_aarch64=('0facbe5b578628b4882a3e1df06ddff2283e2ec641f52932371cc0a3103a6bd6')

package() {
  cd "${srcdir}/dwarfs-${pkgver}-Linux-$arch"

  install -Dm755 bin/dwarfsbench "${pkgdir}/usr/bin/dwarfsbench"
  install -Dm755 bin/dwarfsck "${pkgdir}/usr/bin/dwarfsck"
  install -Dm755 bin/dwarfsextract "${pkgdir}/usr/bin/dwarfsextract"
  install -Dm755 bin/mkdwarfs "${pkgdir}/usr/bin/mkdwarfs"

  install -Dm755 sbin/dwarfs "${pkgdir}/usr/bin/dwarfs"
  install -Dm755 sbin/dwarfs2 "${pkgdir}/usr/bin/dwarfs2"
  ln -s dwarfs "${pkgdir}/usr/bin/mount.dwarfs"
  ln -s dwarfs2 "${pkgdir}/usr/bin/mount.dwarfs2"

  install -Dm644 share/man/man1/dwarfs.1 "$pkgdir/usr/share/man/man1/dwarfs.1"
  install -Dm644 share/man/man1/dwarfsck.1 "$pkgdir/usr/share/man/man1/dwarfsck.1"
  install -Dm644 share/man/man1/dwarfsextract.1 "$pkgdir/usr/share/man/man1/dwarfsextract.1"
  install -Dm644 share/man/man1/mkdwarfs.1 "$pkgdir/usr/share/man/man1/mkdwarfs.1"

  install -Dm644 share/man/man5/dwarfs-format.5 "$pkgdir/usr/share/man/man5/dwarfs-format.5"
}
