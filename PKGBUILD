# Maintainer: Bet4 <0xbet4@gmail.com>

# Special thanks to Alexey Nurmukhametov that provided the
# original PKGBUILD from triton (https://aur.archlinux.org/packages/triton/)

_pkgname=triton
pkgname=${_pkgname}-git
pkgver=0.8.1.r266.g6b929c39
pkgrel=1
pkgdesc='Dynamic binary analysis framework'
url='https://triton.quarkslab.com/'
arch=('x86_64')
license=('Apache')
depends=('capstone' 'z3' 'python')
makedepends=('git' 'boost' 'cmake')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("$pkgname::git+https://github.com/JonathanSalwan/Triton.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
