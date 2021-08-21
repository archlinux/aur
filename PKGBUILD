# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Kaushal M

pkgname=fuse-overlayfs-git
pkgver=1.7.1.r2.gb47bccf
pkgrel=1
epoch=1
pkgdesc="FUSE implementation for overlayfs"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/containers/fuse-overlayfs"
license=(GPL3)
provides=(fuse-overlayfs)
conflicts=(fuse-overlayfs)
depends=(fuse3)
makedepends=(git)
source=("git+https://github.com/containers/fuse-overlayfs.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-*}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-*}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname%-*}"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname%-*}"
  make DESTDIR="$pkgdir" install
}
