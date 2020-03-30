# Maintainer: Jeffrey Zhang zhang.lei.fly@gmail.com
pkgname=terminator-git
pkgver=2.11.2.gb32662a
pkgrel=1
pkgdesc='python3 port for terminal emulator that supports tabs and grids python3'
arch=('any')
url='https://github.com/JAugusto42/terminator.git'
license=('GPL2')
depends=('vte3' 'gconf' 'xdg-utils' 'libkeybinder3' 'python-configobj'
        'python-psutil' 'python-gobject')
makedepends=('git' 'desktop-file-utils' 'gettext' 'intltool')
conflicts=('terminator' 'terminator-gtk3-bzr')
source=("git+https://github.com/JAugusto42/terminator.git")
sha256sums=('SKIP')

install=terminator-git.install

pkgver() {
  cd "${srcdir}/terminator"
  printf "%s" "$(git describe --tags|sed 's/-/./g')"
}

build() {
    cd "${srcdir}/terminator"
    python3 setup.py build
}

package() {
    cd "${srcdir}/terminator"

    python3 setup.py install --skip-build --root="${pkgdir}"

    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
