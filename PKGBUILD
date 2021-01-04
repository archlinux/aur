# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=ply-git
_pkgname=ply
pkgrel=1
pkgver=2.1.1.r10.gd720bb6
pkgdesc="A light-weight dynamic tracer for Linux"
arch=('x86_64')
url="https://github.com/iovisor/ply"
license=('GPL2')
provides=('ply')
makedepends=('git')
depends=('glibc')
source=("git+https://github.com/iovisor/${_pkgname}")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    ./autogen.sh   # to generate the configure script
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

package() {
    cd "${_pkgname}"
    make DESTDIR="${pkgdir}/" install
}
