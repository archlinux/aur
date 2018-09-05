# Maintainer: Tinh Truong <xuantinh at gmail dot com>
pkgname=aur-pkg-status
pkgver=0.1.0
pkgrel=4
pkgdesc="A small utility to check the status of the AUR packages installed on your ArchLinux machine"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/tinhtruong/aur-pkg-status/"

source=("https://github.com/tinhtruong/aur-pkg-status/archive/v${pkgver}.tar.gz")
sha256sums=('3c2eb8ec02036cbbefd1540227a01638ee1fe942b126fab67b877f78ecf5b09b')

makedepends=('go')
depends=('pacman')

build() {
        cd "$srcdir"/aur-pkg-status-${pkgver}
        export GOPATH=`pwd`:`pwd`/vendor
        cd src/github.com/tinhtruong/aur-pkg-status
        go build
}

package() {
	install -d "${pkgdir}"/opt/aur-pkg-status
	install -d "${pkgdir}"/usr/bin
        cp "$srcdir"/aur-pkg-status-${pkgver}/src/github.com/tinhtruong/aur-pkg-status/aur-pkg-status "${pkgdir}"/opt/aur-pkg-status/aur-pkg-status
        cp "$srcdir"/aur-pkg-status-${pkgver}/LICENSE "${pkgdir}"/opt/aur-pkg-status/LICENSE
        ln -s ../../opt/aur-pkg-status/aur-pkg-status "$pkgdir"/usr/bin/aur-pkg-status
}
