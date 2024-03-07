# shellcheck shell=bash
# Maintainer: Chinmay Dalal <w5vwg64uy at relay dot firefox dot com>

pkgname=powertop-git
_pkgname=powertop
pkgver=2.15.r11.g9beafe3
pkgrel=1
pkgdesc='A tool to diagnose issues with power consumption and power management, git version'
arch=('i686' 'x86_64')
url='https://01.org/powertop/'
license=('GPL2')
makedepends=('git' 'autoconf-archive')
depends=('gcc-libs' 'libnl' 'ncurses' 'pciutils' 'libtracefs')
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
    cd "${srcdir}/${_pkgname}"

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgname}"

    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}
