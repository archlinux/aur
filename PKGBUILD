# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=('grit-task-manager')
_pkgname=('grit')
pkgver=0.3.0
pkgrel=2
pkgdesc="A multitree-based personal task manager"
arch=('any')
license=('MIT')
url="https://github.com/climech/grit"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
makedepends=('go' 'git')
sha256sums=('6c6ef08ba01c080e0d7fc3dd7fdaf1c8662dad6456da22ef453e2963c44bab01')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "${srcdir}/${_pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" grit
}
