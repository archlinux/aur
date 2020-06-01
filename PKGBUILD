# Maintainer: Jat <chat@jat.email>

_pkgname=obs-multi-rtmp
pkgname=${_pkgname}-git
pkgver=r34.add82fd
_obsver=25.0.8
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('unknown')
depends=('obs-studio')
makedepends=('git' 'cmake')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+${url}.git"
        "obs-studio-${_obsver}.tar.gz::https://github.com/obsproject/obs-studio/archive/${_obsver}.tar.gz")
sha256sums=('SKIP'
            'ef1179c23256c312212e3dce9083d4fa67751db05c3001ad824e2b6995943941')

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
