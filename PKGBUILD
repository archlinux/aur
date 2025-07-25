# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=samurai-static
_pkgname=samurai
pkgver=1.2
pkgrel=1
pkgdesc="ninja-compatible build tool written in C"
provides=(samurai)
conflicts=(samurai)
makedepends=('musl' 'gcc' 'make' 'gzip')
arch=(aarch64 'x86_64')
url="https://github.com/michaelforney/${_pkgname}"
license=('ISC' 'Apache' 'MIT')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('37a2d9f35f338c53387eba210bab7e5d8abe033492664984704ad84f91b71bac')
b2sums=('31ec4e728a90bbbba49964487c1c682a8cf3684bf05962dc74a73f51a9e3b539e1b8044b24001c748cd75de51f91850671342d87cc3d27f03b5f50f857bd5965')

build() {
    export CC=musl-gcc CFLAGS="$CFLAGS -Os" LDFLAGS="$LDFLAGS -static"
    make -C ${_pkgname}-${pkgver} -j $(nproc) samu
}

package() {
    cd ${_pkgname}-${pkgver}
    make install PREFIX=/usr DESTDIR="${pkgdir}"
    strip "${pkgdir}"/usr/bin/samu
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
