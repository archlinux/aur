# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=rapidjson
pkgver=1.0.2
pkgrel=1
pkgdesc="Rapidjson is an attempt to create the fastest JSON parser and generator."
arch=('any')
url="https://github.com/miloyip/rapidjson.git"
license=(GPL)
depends=()
makedepends=(gcc cmake)
source=(
    #"${pkgname}::git+https://github.com/miloyip/rapidjson.git"
    "${pkgname}-${pkgver}.tar.gz::https://github.com/miloyip/rapidjson/archive/v${pkgver}.tar.gz"
    )
sha1sums=(
    'SKIP'
    )
conflicts=(rapidjson-git)

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver_svn() {
    cd "${srcdir}/${pkgname}"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

#pkgver() {
#    pkgver_git
#}

build4git() {
    cd "${srcdir}/${pkgname}"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr/ ..
    make
}

build4release() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr/ ..
    make
}

build () {
    build4release
}

package4git() {
    cd "${srcdir}/${pkgname}"
    cd build
    make install
}

package4release() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cd build
    make install
}

package() {
    package4release
}
