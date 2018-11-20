# Maintainer: Kaushal M

pkgname=fuse-overlayfs-git
pkgver=107
pkgrel=1
pkgdesc="FUSE implementation for overlayfs"
arch=('x86_64')
url="https://github.com/containers/fuse-overlayfs"
license=('GPL3')
depends=('fuse3')
source=("${pkgname%-*}::git+https://github.com/containers/fuse-overlayfs.git")

sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-*}"

  git rev-list --count HEAD
}

build() {
  cd "${srcdir}/${pkgname%-*}"

  ./autogen.sh
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
