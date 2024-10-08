# Maintainer: Owen Trigueros <owentrigueros@gmail.com>

pkgname=httpdirfs-git
pkgver=r586.de9e594
pkgrel=1
pkgdesc="A filesystem which allows you to mount HTTP directory listings"
arch=('x86_64' 'aarch64')
url="https://github.com/fangfufu/httpdirfs"
license=('GPL')
depends=('gumbo-parser' 'fuse3' 'curl' 'expat' 'util-linux-libs' 'openssl')
makedepends=('meson' 'help2man' 'doxygen' 'graphviz')
provides=('httpdirfs')
conflicts=('httpdirfs')
source=("$pkgname::git+https://github.com/fangfufu/httpdirfs.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
