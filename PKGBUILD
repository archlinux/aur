# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: envolution
# Contributor: FirstAirBender <noblechuk5 [at] web [dot] de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=autotrace-git
pkgver=0.31.11.r1.g22faea6
pkgrel=1
pkgdesc='A program for converting bitmap to vector graphics (git version)'
arch=('x86_64')
url='https://github.com/autotrace/autotrace/'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=(
    'glib2'
    'glibc'
    'imagemagick'
    'libgcc'
    'libpng'
    'pstoedit')
makedepends=(
    'git'
    'intltool')
checkdepends=(
    'ffmpeg'
    'procps-ng')
provides=('autotrace')
conflicts=('autotrace')
source=('git+https://github.com/autotrace/autotrace.git')
sha256sums=('SKIP')

prepare() {
    cd autotrace
    ./autogen.sh
}

pkgver() {
    git -C autotrace describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd autotrace
    ./configure \
        --prefix='/usr' \
        --disable-static \
        --with-magick \
        --with-png \
        --with-pstoedit
    make
}

check() {
    make -C autotrace check
}

package() {
    make -C autotrace DESTDIR="$pkgdir" install
}
