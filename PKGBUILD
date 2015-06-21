pkgname='lxqt-connman-applet-git'
pkgdesc='LxQt system-tray applet for connman'
url='https://github.com/surlykke/lxqt-connman-applet'
provides=('lxqt-connman-applet')
conflicts=('lxqt-connman-applet')

depends=('liblxqt-git')
makedepends=('cmake' 'qt5-tools')

pkgver=r28.2bd20a8
pkgrel=2
source=("$pkgname::git+https://github.com/surlykke/lxqt-connman-applet.git")
md5sums=('SKIP')

arch=('i686' 'x86_64')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  cmake . \
     -DCMAKE_INSTALL_PREFIX=/usr \
     -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
