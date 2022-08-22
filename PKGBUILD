# Maintainer: Cooper Pierce <cppierce@andrew.cmu.edu>
pkgname=smlpkg
_reponame="${pkgname}"
pkgver=0.1.5
pkgrel=1
pkgdesc="Generic package manager for Standard ML libraries and programs"
url="https://github.com/diku-dk/smlpkg"
arch=('x86_64')
license=('MIT')
makedepends=('make' 'mlton')
source=("${_reponame}-$pkgver.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('c93d37db6566dd3948a3d59d57792de8')

build() { 
    cd "${_reponame}-${pkgver}"
    MLCOMP=mlton make all
}

package() {
    cd "${_reponame}-${pkgver}"
    make install prefix="${pkgdir}/usr"
}

check() {
    cd "${_reponame}-${pkgver}"
    MLCOMP=mlton make -C src test
}
