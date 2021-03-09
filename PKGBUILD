# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=clight
_gitname=Clight
pkgver=4.4
pkgrel=2
pkgdesc="A C daemon that turns your webcam into a light sensor. It can also change display gamma temperature, dim your screen and set your dpms."
arch=('i686' 'x86_64')
url="https://github.com/FedeDP/${_gitname}"
license=('GPL')
backup=(etc/default/clight.conf)
depends=('systemd-libs' 'popt' 'libconfig' 'gsl' 'clightd-git' 'libmodule>=5.0.0' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'bash-completion')
optdepends=('geoclue2: to retrieve user location through geoclue2.'
            'upower: to save energy by managing ac states increasing timeouts while on battery.'
            'bash-completion: to add support for bash automatic completion.')
provides=('clight')
conflicts=('clight-git')
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
install=clight.install
sha256sums=("1371ac6f537cec4fc61581dbb6ceb143df08f20e24f884fa148068008864b054")

prepare() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${_gitname}-${pkgver}/build"
    cmake \
        -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
        ..
    make
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}/build"
    make DESTDIR="$pkgdir" install
}
