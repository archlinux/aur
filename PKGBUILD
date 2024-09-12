# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wluma-git
_pkgname=${pkgname%-git}
pkgver=4.4.0.r3.g8df0b8e
pkgrel=1
license=('ISC')
pkgdesc='Automatic brightness adjustment based on screen contents and ALS'
url='https://github.com/maximbaz/wluma'
arch=('x86_64' 'aarch64')
provides=('wluma')
conflicts=('wluma')
depends=('vulkan-icd-loader' 'systemd-libs' 'glibc' 'gcc-libs' 'v4l-utils')
optdepends=('vulkan-driver: for using capturer=wlroots in config.toml'
            'wayland: for using capturer=wlroots in config.toml')
makedepends=('git' 'cargo' 'clang' 'systemd' 'marked-man')
source=("git+https://github.com/maximbaz/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    make build docs
}

check() {
    cd "${_pkgname}"
    make test
}

package() {
    cd "${_pkgname}"
    make install DESTDIR="${pkgdir}"
}
