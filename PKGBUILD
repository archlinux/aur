pkgname=vesc-tool
pkgver=7.00
_pkgver=7_00
pkgrel=1
pkgdesc="VESC ESC graphical configuration tool"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://vesc-project.com/vesc_tool"
license=('GPL3')
depends=('qt5-base' 'qt5-connectivity' 'qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-graphicaleffects' 'qt5-serialport' 'qt5-location' 'qt5-gamepad' 'qt5-serialbus' 'qt5-svg')
makedepends=('git' 'mold')
conflicts=('vesc_tool-git')
source=("$pkgname"::"git+https://github.com/vedderb/vesc_tool.git#branch=release_$_pkgver"
        'vesc-tool.desktop')
sha256sums=('SKIP'
            '03d9bf65f8273d1b5e6f945b93a51719833179b8d20f83d839dc7f7422ef5080')
options=(!debug)

build() {
  cd "${srcdir}/${pkgname}"
  qmake-qt5 PREFIX=/usr target.path=/usr/bin LIBDIR=/usr/lib INSTALLS+=target -config release "CONFIG += release_lin build_original exclude_fw"
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 ../vesc-tool.desktop \
    "$pkgdir/usr/share/applications/vesc-tool.desktop"

  install -Dm644 'res/+theme_light/icons/v_icon-256.png' \
    "$pkgdir/usr/share/icons/vesc-tool.png"
}

