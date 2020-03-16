# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Maintainer: Albert Westra <odysseywestra@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>
# Contributor: mosra <mosra@centrum.cz>

_basever=2.0.0.master
pkgname=mypaint-brushes-git
pkgver=2.0.0.master.r194.0df6d13
pkgrel=1
pkgdesc="Brushes used by MyPaint and other software using libmypaint"
arch=('any')
url="https://github.com/mypaint/mypaint-brushes"
license=('custom:CC0')
depends=('libmypaint-git')
makedepends=('git')
provides=("mypaint-brushes=${_basever}")
conflicts=('mypaint-brushes')
source=('git+https://github.com/mypaint/mypaint-brushes.git')

pkgver() {
    cd "${srcdir}/mypaint-brushes"
    printf "${_basever}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//g;s/-/./g'
}

prepare() {
    cd "${srcdir}/mypaint-brushes"
    ./autogen.sh
}

build() {
    cd "${srcdir}/mypaint-brushes"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/mypaint-brushes"
    make DESTDIR="${pkgdir}" install
    install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('SKIP')
