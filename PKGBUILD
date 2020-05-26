# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=wluma-als-emulator-git
_pkgname=${pkgname%-git}
pkgver=1.1.0.r18.gf7f93a4
pkgrel=2
pkgdesc="Ambient light sensor emulator for wluma"
license=(MIT)
url="https://github.com/cyrinux/${_pkgname}"
depends=('python' 'python-setuptools' 'python-dateutil' 'wluma')
optdepends=(
    'python-pillow: for webcam strategy',
    'python-requests: for api based strategies',
    'ffmpeg: for webcam strategy'
)
arch=(any)
makedepends=('git')
conflicts=('wluma-als-emulator')
provides=('wluma-als-emulator')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd "${_pkgname}"
    make build
}

package() {
    cd "${_pkgname}"
    make package DESTDIR="${pkgdir}"
}
