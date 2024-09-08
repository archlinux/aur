# Maintainer: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

pkgname=opkg-utils-git
pkgver=0.7.0
pkgrel=1
pkgdesc="Helper scripts for use with the opkg package manager"
arch=('x86_64')
url="https://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
license=('GPL')
makedepends=('git')
provides=(opkg-utils)
conflicts=(opkg-utils)
source=("git+http://git.yoctoproject.org/git/opkg-utils#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd opkg-utils
    git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {
    cd opkg-utils
    git checkout "$pkgver"
}

build() {
    cd opkg-utils
    make
}

package() {
    cd opkg-utils
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
