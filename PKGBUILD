# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=libshmfile
_basename="shmfile"
pkgver=1.1.0
pkgrel=1
pkgdesc="Small shared library to use shared memory as a FILE* stream , with interprocess communication in mind"
arch=('i686' 'x86_64')
license=('apache')
url="http://github.com/kata198/shmfile"
makedepends=('gcc' 'make')
depends=('glibc')
source=("https://github.com/kata198/${_basename}/archive/${pkgver}.tar.gz")
sha512sums=("cd664545953bc11b800e8a4058591126f029e5dde025aefaee627cd6f3a2dfbbcd4a24692e7273af6926bad05317e33df8bc10e8db0652ea99961951408b567a")

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

  # Makefile expects this directory to exist
  mkdir -p "${pkgdir}/usr/share/man/man3"
 
  make install DESTDIR="${pkgdir}"
  make install_static DESTDIR="${pkgdir}"
}
