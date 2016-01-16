# Maintainer: Jingbei Li <i@jingbei.li>

pkgname=libwebsockets-git
_gitname=libwebsockets
pkgver=1160.a2a4b0b
pkgrel=3
pkgdesc="A lightweight pure C library built to use minimal CPU and memory resources, and provide fast throughput in both directions."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://libwebsockets.org"
depends=('openssl' 'make')
makedepends=('cmake')
license=('LGPL')
source=("git://git.libwebsockets.org/libwebsockets")
sha256sums=('SKIP')

pkgver() {
    cd $_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_gitname}"
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="${pkgdir}" install

  cd ..
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
  cd "$pkgdir/usr"
}
