pkgname=vesc_tool-git
pkgver=2.03
pkgrel=1
pkgdesc="VESC ESC graphical configuration tool"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://vesc-project.com/vesc_tool"
license=('GPL3')
depends=('qt5-base' 'qt5-connectivity' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-location')
makedepends=('git')

source=("$pkgname"::"git+https://github.com/vedderb/vesc_tool.git"
        'vesc_tool.pro')

sha256sums=('SKIP'
            'fb9eb66d9ef00606f61754a7efa8dbab18dff810c674a106e2e770e62899be68')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "${pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    cp ${srcdir}/vesc_tool.pro .
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake PREFIX=/usr LIBDIR=/usr/lib
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make INSTALL_ROOT="$pkgdir" install
}

