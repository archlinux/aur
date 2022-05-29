# Maintainer: Jef Roosens

pkgbase=yip-git
pkgname=yip-git
pkgver=0.1.2.r0.gdbcdd0d
pkgrel=1
pkgdesc="Performant, lightweight HTTP server that echoes the client's IP address, written in plain C. (Development version)"
arch=('x86_64')

url='https://github.com/jenspots/yip'
license=('AGPL-3.0')

source=("${pkgname}::git+https://github.com/jenspots/yip#branch=main")
md5sums=('SKIP')

pkgver() {
    git -C "${pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"

    gcc -o yip -O3 -lpthread yip.c
}

package() {
    install -Dm755 "${pkgname}/yip" "${pkgdir}/usr/bin/yip"
    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/LICENSE"
}
