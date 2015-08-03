# Maintainer: Silvio Knizek <killermoehre@gmx.net>

_pkgname=xfce4-hotcorner-plugin
pkgname="${_pkgname}-git"
pkgver=0.0.2.r1.g996f76a
pkgrel=1
pkgdesc="Provides an easy way to set up hot corners in the Xfce desktop environment"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/brianhsu/xfce4-hotcorner-plugin"
groups=("xfce4")
depends=('xfce4-panel' 'libwnck3')
makedepends=('cmake' 'xfce4-dev-tools' 'git')
provides=("${_pgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}::git+https://github.com/brianhsu/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed -r "s/^${_pkgname}-//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir" install
}

