# shellcheck shell=bash
# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: Chinmay Dalal <w5vwg64uy at relay dot firefox dot com>

pkgname=powertop-git
_pkgname=powertop
pkgver=2.16.rc2.r0.g4d5ea4d
pkgrel=1
pkgdesc='A tool to diagnose issues with power consumption and power management, git version'
arch=('i686' 'x86_64')
url='https://github.com/fenrus75/powertop/'
license=('GPL2')
makedepends=(
        'meson'
        'ninja'
        'git'
)
depends=(
		'gcc-libs'
		'libnl'
		'libtracefs'
		'ncurses'
		'pciutils'
)
optdepends=('xorg-xset: for the --calibrate function')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://github.com/fenrus75/powertop.git)
sha256sums=('SKIP')

# template start; name=git-pkgver-r; version=1.0;
pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed -E 's/([^-]+-g)/r\1/;s/-/./g;s/^v//g'
}

build() {
    arch-meson "${srcdir}/${_pkgname}" build
    ninja -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
