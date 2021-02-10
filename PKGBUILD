# Maintainer: Jat <chat@jat.email>

_pkgname=obs-multi-rtmp
pkgname=${_pkgname}-git
pkgver=r62.4cb298e
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('unknown')
depends=('obs-studio')
makedepends=('git' 'cmake')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_obsver=26.1.1
source=("git+${url}.git"
        "obs-studio-${_obsver}.tar.gz::https://github.com/obsproject/obs-studio/archive/${_obsver}.tar.gz")
sha256sums=('SKIP'
            '19F55EAC1C315A6101B024B44C858D1254E1A4A38D87D5E9C9A5274CC532A450')

pkgver() {
    cd ${srcdir}/${_pkgname}
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    OBS_SRC_DIR=../obs-studio-${_obsver} ./build_linux.sh
}

package() {
    cp -aT "${srcdir}/${_pkgname}/dist" ${pkgdir}
}
