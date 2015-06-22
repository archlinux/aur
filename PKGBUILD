# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=openhmd-git
pkgver=0.1.0.9.g3f60c20
pkgrel=1
pkgdesc="Free and Open Source API and drivers for immersive technology. Supports Oculus Rift."
arch=(x86_64 i686)
url="https://github.com/OpenHMD/OpenHMD"
license=(Boost)
depends=(hidapi-git)
options=()
conflicts=('openhmd')
provides=('openhmd')

optdepends=(
  'oculus-udev: Udev rule for Oculus Rift'
)

_gitname='OpenHMD'
source=("git+https://github.com/OpenHMD/OpenHMD.git")
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
  mv $pkgdir/usr/bin/simple $pkgdir/usr/bin/openhmd-example
  mv $pkgdir/usr/bin/unittests $pkgdir/usr/bin/openhmd-unittests
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
