# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=libshmfile
_basename="shmfile"
pkgver=1.0.0
pkgrel=1
pkgdesc="Small shared library to use shared memory as a FILE* stream , with interprocess communication in mind"
arch=('i686' 'x86_64')
license=('apache')
url="http://github.com/kata198/shmfile"
makedepends=('gcc' 'make')
depends=('glibc')
source=("https://github.com/kata198/${_basename}/archive/${pkgver}.tar.gz")
sha512sums=("2fffa65f514ee10f713b940d87f1c58c2a2a9388c6d62f4f7304537e1cfdfbcffe3c7db187a6f78cc8a315f9e227897b18ac2614a27310b9ad3dce4ecf2a7729")

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
