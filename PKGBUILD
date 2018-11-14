# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=libshmfile
_basename="shmfile"
pkgver=1.1.0
pkgrel=2
pkgdesc="Small shared library to use shared memory as a FILE* stream , with interprocess communication in mind"
arch=('i686' 'x86_64')
license=('apache')
url="http://github.com/kata198/shmfile"
makedepends=('gcc' 'make')
depends=('glibc')
source=("https://github.com/kata198/${_basename}/archive/${pkgver}.tar.gz")
sha512sums=("60643388cf64b190c9bbbe0f8f0f254fdb05c43c5ab2d74cd43036149b865ff92c084659c912f0561be3a115023635597f91307d2d8aa55fced5f300cce7279a")

build() {
  cd "${srcdir}/${_basename}-${pkgver}"
  
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
  # Build and install static libs. If options has !staticlibs
  #   set in /etc/makepkg.conf, the static lib will be removed
  #   during packaging.
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" static
  
}

package() {
  cd "${srcdir}/${_basename}-${pkgver}"

  make install DESTDIR="${pkgdir}"
  make install_static DESTDIR="${pkgdir}"
}
