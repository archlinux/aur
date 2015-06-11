# $Id$
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Xilon <xilonmu@gmail.com>
# Contributor: William Giokas <1007380@gmail.com>

pkgname=powertop-git
_pkgname=powertop
pkgver=2.7.r17.g98f5452
pkgrel=1
pkgdesc='A tool to diagnose issues with power consumption and power management, git version'
arch=('i686' 'x86_64')
url='https://01.org/powertop/'
license=('GPL2')
makedepends=('git')
depends=('gcc-libs' 'libnl' 'ncurses' 'pciutils')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://github.com/fenrus75/powertop.git)
sha256sums=('SKIP')

# template start; name=git-pkgver-r; version=1.0;
pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags --long | sed -E 's/([^-]+-g)/r\1/;s/-/./g;s/^v//g'
}

build() {
    cd ${srcdir}/$_pkgname

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd ${srcdir}/$_pkgname

    make DESTDIR=${pkgdir} install
    mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
