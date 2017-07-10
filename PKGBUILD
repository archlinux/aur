# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contribotur: Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=adbfs-rootless-git
pkgver=r81.b589634
pkgrel=1
pkgdesc='fuse filesystem over adb tool for android devices, no device root required'
arch=(i686 x86_64)
url='https://github.com/spion/adbfs-rootless'
license=(BSD)
depends=(gcc-libs fuse)
makedepends=(git)
source=(git+https://github.com/spion/adbfs-rootless
        https://patch-diff.githubusercontent.com/raw/spion/adbfs-rootless/pull/21.patch)
sha1sums=('SKIP'
          'ae9f468d95fa7d1efad2bdafd6fbf93aa7882ea8')

pkgver() {
  cd adbfs-rootless
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd adbfs-rootless
  # Uncomment the line below if you use Nougat
  #patch -p1 < ${srcdir}/21.patch
  make
}

package() {
  cd adbfs-rootless
  install -Dm755 adbfs "$pkgdir/usr/bin/adbfs"
  install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
