# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien.flament at gmx dot com>

pkgname=libdxfrw-git
pkgver=LC2.2.0.r29.gd68fb1e
pkgrel=1
pkgdesc="C++ library to read/write DXF files in binary and ASCII form and to read DWG files from r14 to v2015."
url="http://sourceforge.net/projects/libdxfrw"
license=('GPL')

arch=('x86_64')
makedepends=('git' 'cmake')
depends=()

conflicts=('libdxfrw')
provides=("libdxfrw=${pkgver}")

source=("${pkgname}::git+https://github.com/LibreCAD/libdxfrw.git")
sha256sums=('SKIP')

function pkgver
{
    cd "$pkgname" || return

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

function prepare
{
    cmake -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -S "$pkgname" \
        -B build \
        -DCMAKE_BUILD_TYPE=Release
}

function build
{
    cd build || return

    make all
}

function package
{
    cd build || return

    make install DESTDIR="$pkgdir"
}
