# Maintainer: Silvio Knizek <killermoehre@gmx.net>

_pkgname=xfce4-hotcorner-plugin
pkgname="${_pkgname}-git"
pkgver=0.0.4.r8.gfea4b50
pkgrel=1
pkgdesc="Provides an easy way to set up hot corners in the Xfce desktop environment"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/christopherkobayashi/${_pkgname}"
groups=("xfce4")
depends=('xfce4-panel' 'libwnck3')
makedepends=('xfce4-panel' 'libwnck3' 'libnotify' 'gtk3' 'intltool')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed -r "s/^${_pkgname}-//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./configure --prefix=/usr && make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir" install
}
