# Maintainer: FrozenCow <frozencow@gmail.com>

pkgname=libusrsctp-git
pkgver=2252.80e6e7e
pkgrel=1
pkgdesc="A portable SCTP userland stack"

arch=('i686' 'x86_64')
url="https://github.com/sctplab/usrsctp"
license=('custom')

source=("${pkgname}::git+https://github.com/sctplab/usrsctp.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${pkgname}
  unset CPPFLAGS
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="$pkgdir/" install
}
