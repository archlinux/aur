# Maintainer: Jeffrey Zhang zhang.lei.fly@gmail.com
pkgname=terminator-git
pkgver=1.92.3.ga92ea847
pkgrel=1
pkgdesc='multiple GNOME terminals in one window'
arch=('any')
url='https://github.com/gnome-terminator/terminator.git'
license=('GPL2')
depends=('vte3' 'gconf' 'xdg-utils' 'libkeybinder3' 'python-configobj'
        'python-psutil' 'python-gobject')
makedepends=('git' 'intltool')
conflicts=('terminator' 'terminator-gtk3-bzr')
source=("git+https://github.com/gnome-terminator/terminator.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/terminator"
  printf "%s" "$(git describe --tags|sed -e 's/^v//g' -e 's/-/./g')"
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
