# Maintainer: Avery Murray <averylapine@gmail.com>

pkgname=cimplefetch
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple program to fetch system information written in C"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/caverym/cimplefetch"
license=('GPL3')
makedeppends=('git')

source=('git+https://github.com/caverym/cimplefetch.git')

sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"
	git submodule init
	git submodule update
	git checkout 129e11e
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"

    cp -f "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -D -m 755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin"
}
