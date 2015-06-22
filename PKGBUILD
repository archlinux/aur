# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=libovr_nsb-git
pkgver=1878f25
pkgrel=1
pkgdesc="Pure C implementation of the Oculus Rift SDK"
arch=(x86_64 i686)
url="https://github.com/ultranbrown/libovr_nsb"
license=("Oculus Rift SDK License")
depends=(hidapi-git freeglut)
options=()
conflicts=('libovr_nsb')
provides=('libovr_nsb')

optdepends=(
  'oculus-udev: Udev rule for Oculus Rift'
)

_gitname='libovr_nsb'
source=("git+https://github.com/ultranbrown/libovr_nsb.git")
sha256sums=("SKIP")

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  ./autogen.sh 
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  rm $pkgdir/usr/bin/gldemo
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
