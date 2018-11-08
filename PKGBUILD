# Maintainer: epitron <chris AT ill-logic.com>

pkgname=mergerfs-git
pkgver=2.25.0.r0.g606d9c4
pkgrel=1
pkgdesc='Powerful FUSE UNION filesystem which gives fine control over how reads/writes are distributed, and allows underlying mounts/settings to be changed at runtime without remounting (using "magic" xattrs)'
url='https://github.com/trapexit/mergerfs'
arch=('i686' 'x86_64')
options=('!emptydirs')
provides=('mergerfs')
conflicts=('mergerfs')
license=('MIT')
depends=('fuse')
source=('git+https://github.com/trapexit/mergerfs.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mergerfs"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/mergerfs"
  make DESTDIR="${pkgdir}" PREFIX="/usr" SBINDIR="/usr/bin"
}

package() {
  cd "${srcdir}/mergerfs"
  mkdir -p "${pkgdir}"/usr/{share,bin}
  mkdir -p "${pkgdir}"/usr/share/licenses/mergerfs
  make DESTDIR=${pkgdir} PREFIX=/usr SBINDIR="/usr/bin" install
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}

