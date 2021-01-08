# Maintainer: Triangulum Labs <triangulumlabs@gmail.com>
# Contributor: FrozenCow <frozencow@gmail.com>

pkgname=libusrsctp-git
pkgver=3425.6093769
pkgrel=2
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
  cmake .
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
