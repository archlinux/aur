# Maintainer: noodle <silentnoodle@cock.li>
pkgname=dwarfs-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='A fast high compression read-only file system (pre-compiled binaries)'
url='https://github.com/mhx/dwarfs'
source=("https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}-Linux.tar.xz")
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=(
  'fuse3' 'openssl' 'boost-libs' 'jemalloc' 'xxhash'
  'lz4' 'xz' 'zstd' 'libarchive'
  'libunwind' 'google-glog' 'fmt' 'gflags' 'double-conversion'
)
conflicts=('dwarfs')
provides=('dwarfs')
sha256sums=('138b3f99e39ad9a5aa84f3dcd1d58e2847ca0353644a2e8f629a61ccf8795676')

package() {
  cd "${srcdir}/dwarfs-${pkgver}-Linux"
  install -Dm755 bin/dwarfsbench "${pkgdir}/usr/bin/dwarfsbench"
  install -Dm755 bin/dwarfsck "${pkgdir}/usr/bin/dwarfsck"
  install -Dm755 bin/dwarfsextract "${pkgdir}/usr/bin/dwarfsextract"
  install -Dm755 bin/mkdwarfs "${pkgdir}/usr/bin/mkdwarfs"

  install -Dm755 sbin/dwarfs "${pkgdir}/usr/bin/dwarfs"
  ln -s dwarfs "${pkgdir}/usr/bin/mount.dwarfs"

  install -Dm644 share/man/man1/dwarfs.1 "$pkgdir/usr/share/man/man1/dwarfs.1"
  install -Dm644 share/man/man1/dwarfsck.1 "$pkgdir/usr/share/man/man1/dwarfsck.1"
  install -Dm644 share/man/man1/dwarfsextract.1 "$pkgdir/usr/share/man/man1/dwarfsextract.1"
  install -Dm644 share/man/man1/mkdwarfs.1 "$pkgdir/usr/share/man/man1/mkdwarfs.1"

  install -Dm644 share/man/man5/dwarfs-format.5 "$pkgdir/usr/share/man/man5/dwarfs-format.5"
}
