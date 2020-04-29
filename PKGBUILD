# Maintainer: Jonathan Tremesaygues <killruana@slaanesh.org>

pkgname=tritonroute-git
pkgver=r18.9afba7c
pkgrel=1
pkgdesc='UCSD Detailed Router'
arch=('x86_64')
provides=('tritonroute')
conflicts=('tritonroute')
url='https://github.com/The-OpenROAD-Project/TritonRoute'
license=('BSD')
makedepends=('boost' 'cmake' 'git')
source=('git://github.com/The-OpenROAD-Project/TritonRoute.git' 
        'fix_install.patch'
        'fix_headers_list.patch')
sha256sums=('SKIP'
            '6ea36155d11326d59eaa7090ecb13580971763863629aeda994f09d64d990a7d'
            '96ce8f01b4a875a2d30969f5763451f55d7fc7e66dfca47f3201e14317c2475d')

pkgver() {
    cd "${srcdir}/TritonRoute"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/TritonRoute"
    patch --strip=1 --input="${srcdir}/fix_install.patch"
    patch --strip=1 --input="${srcdir}/fix_headers_list.patch"
}

build() {
    cd "${srcdir}/TritonRoute"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
    cmake --build build
}

package() {
    cd "${srcdir}/TritonRoute"
    DESTDIR="${pkgdir}" cmake --install build
}
