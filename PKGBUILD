# Submiter: ZekeSulastin <zekesulastin@gmail.com>
# Maintainer: AdrianoML <adriano.lols@gmail.com>
# Maintainer: Cazzoo <caz.san@gmail.com>

pkgname=jstest-gtk-git
pkgver=0.1.0.r163.gd910b1c
pkgrel=1
pkgdesc="A simple GTK2-based joystick tester and calibrator"
arch=('i686' 'x86_64')
url="https://github.com/Grumbel/jstest-gtk"
license=('GPL3')
depends=('gtkmm3')
makedepends=('git' 'cmake')
_gitname="jstest-gtk"
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_gitname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
