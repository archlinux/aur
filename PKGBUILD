# Maintainer: petRUShka <petrushkin@yandex.ru>
pkgname=vkaudiofs-git
pkgrel=1
pkgver=r15.2508468
pkgdesc="FUSE virtual file system for VK (VKontakte) audio records"
url="https://github.com/mindcollapse/vkaudiofs"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('fuse' 'json-c')
makedepends=('git' 'pkg-config')
source=("${pkgname}::git+https://github.com/mindcollapse/vkaudiofs.git")
md5sums=(SKIP)
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/${pkgname}"
  sed -i 's/install: all/\0\n\tinstall -d $(BINDIR)/' Makefile
  sed -i 's/json/json-c/' Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
