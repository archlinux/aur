# Maintainer: willemw <willemw12@gmail.com>

_pkgname=usbaudio
pkgname=$_pkgname-git
pkgver=r2.acb9ac8
pkgrel=1
pkgdesc="Forward audio from Android devices"
arch=('x86_64')
url="https://github.com/rom1v/usbaudio"
license=('MIT')
depends=('vlc')
makedepends=('git' 'libpulse' 'meson')
optdepends=('android-tools: adb is required')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git+https://github.com/rom1v/usbaudio.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  meson --prefix=/usr --buildtype=release $pkgname $pkgname/build
  ninja -C $pkgname/build
}

#check() {
#  ninja -C $pkgname/build check
#}

package() {
  DESTDIR="$pkgdir" ninja -C $pkgname/build install
}

