# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=img4lib-git
pkgver=1
pkgrel=2
pkgdesc="Deal with img4 files in a decent manner"
arch=('x86_64')
url="https://github.com/xerub/img4lib"
depends=('openssl-1.0' 'lzfse')
license=('unknown')
source=("git+https://github.com/xerub/img4lib.git")
sha512sums=('SKIP')

prepare() {
  cd "${srcdir}/img4lib"
  sed -i '131i$(VFSSOURCES:.c=.o): CFLAGS += -I/usr/include/openssl-1.0' Makefile
  sed -i '131i$(VFSSOURCES:.c=.o): LDLIBS += -I/usr/lib/openssl-1.0' Makefile
}

build() {
  cd "${srcdir}/img4lib"
  git submodule update --init --recursive
  make LDFLAGS="-L/usr/lib/openssl-1.0"
}

package() {
  cd "${srcdir}/img4lib"
  install -Dm755 img4 "${pkgdir}/usr/bin/img4"
}
