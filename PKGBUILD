# Maintainer: Sander Vrijders <sander.vrijders@ugent.be>
pkgname=ouroboros-git
pkgver=0.15.2.r0.gd6bd976
pkgrel=1
pkgdesc="A completely decentralized packet network"
arch=('x86_64' 'i686' 'arm')
license=('GPL2' 'LGPL2.1' 'BSD')
depends=('protobuf-c')
makedepends=('git' 'fakeroot' 'cmake')
optdepends=('libgcrypt' 'openssl' 'fuse' 'dnsutils' 'swig')
source=("git+https://ouroboros.rocks/git/ouroboros")
url="https://ouroboros.rocks"
noextract=()
md5sums=('SKIP')
_gitname=ouroboros

pkgver() {
  cd ${srcdir}/${_gitname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${_gitname}
    cmake -DCMAKE_INSTALL_LIBDIR='/usr/lib' -DCMAKE_INSTALL_SBINDIR='/usr/bin' . || exit 1
    make -j${nproc} || exit 1
    msg "Build completed"
}

check() {
    cd ${srcdir}/${_gitname}
    make -j${nproc} check
}

package() {
    cd ${srcdir}/${_gitname}
    make DESTDIR="$pkgdir/" install
}
