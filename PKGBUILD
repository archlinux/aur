
pkgname=etlas-git
_pkgname=etlas
pkgver=1.5.1.0.r136.gbbd7c55
pkgrel=1
pkgdesc='Etlas, the build tool and package manager for the Eta programming language'
arch=('x86_64')
url='https://github.com/typelead/etlas'
license=(BSD3)
depends=()
makedepends=('stack')
conflicts=('etlas')
source=("${_pkgname}::git+https://github.com/typelead/etlas.git")
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${_pkgname}"
    stack build etlas
}

package() {
    cd "${srcdir}/${_pkgname}"
    stack install --local-bin-path "${pkgdir}/usr/bin" etlas
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
