# Maintainer: Owen Trigueros <owentrigueros@gmail.com>

pkgname=httpdirfs-git
pkgver=r501.61d3ae4
pkgrel=1
pkgdesc="A filesystem which allows you to mount HTTP directory listings"
arch=('x86_64' 'aarch64')
url="https://github.com/fangfufu/httpdirfs"
license=('GPL')
depends=('gumbo-parser' 'fuse2' 'curl' 'expat')
makedepends=('help2man' 'doxygen')
provides=('httpdirfs')
conflicts=('httpdirfs')
source=("$pkgname::git+https://github.com/fangfufu/httpdirfs.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make man
  make doc
  make
}

package() {
  cd "$pkgname"
  make prefix=/usr DESTDIR="$pkgdir" install
}
