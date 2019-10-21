# Maintainer: Roman Kovtyuk HelloDearGrandma@gmail.com
pkgname=terminator-python3-bzr
pkgver=r1852
pkgrel=1
pkgdesc='python3 port for terminal emulator that supports tabs and grids python3'
arch=('any')
url='https://code.launchpad.net/~hellodeargrandma/terminator/python3'
license=('GPL2')
depends=('vte3' 'gconf' 'xdg-utils' 'libkeybinder3' 'python-configobj'
        'python-psutil' 'python-gobject')
makedepends=('bzr' 'desktop-file-utils' 'gettext' 'intltool')
conflicts=('terminator')
#install='terminator.install'
source=("${pkgname}::bzr+lp:~hellodeargrandma/terminator/python3")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s" "$(bzr revno)"
}

build() {
    cd "${srcdir}/${pkgname}"
    sed -i -e "s/\(APP_VERSION\)\s*=\s*'\(.*\)'/\1 = '\2-${pkgver}'/" \
            terminatorlib/version.py
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"

    python3 setup.py install --skip-build --root="${pkgdir}"

    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}

