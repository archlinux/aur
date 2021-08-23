# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wluma-git
_pkgname=${pkgname%-git}
pkgver=2.0.0.r0.g0b89a60
pkgrel=1
license=('ISC')
pkgdesc='Automatic brightness adjustment based on screen contents and ALS'
url='https://github.com/maximbaz/wluma'
arch=('x86_64')
provides=('wluma')
conflicts=('wluma')
depends=('vulkan-icd-loader' 'vulkan-driver' 'wayland')
makedepends=('git' 'rust')
source=("git+https://github.com/maximbaz/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    make build
}

check() {
    cd "${_pkgname}"
    make test
}

package() {
    cd "${_pkgname}"
    make install DESTDIR="${pkgdir}"
}
