# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wluma-git
_pkgname=${pkgname%-git}
pkgver=3.0.0.r0.g4538b69
pkgrel=1
license=('ISC')
pkgdesc='Automatic brightness adjustment based on screen contents and ALS'
url='https://github.com/maximbaz/wluma'
arch=('x86_64')
provides=('wluma')
conflicts=('wluma')
depends=('vulkan-icd-loader' 'vulkan-driver' 'wayland' 'systemd-libs' 'glibc' 'gcc-libs' 'v4l-utils')
makedepends=('git' 'cargo' 'clang' 'systemd')
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
