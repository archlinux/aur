# Maintainer: Jat <chat@jat.email>

_pkgname=obs-multi-rtmp
pkgname=${_pkgname}-git
pkgver=r49.db3ab57
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('unknown')
depends=('obs-studio')
makedepends=('git' 'cmake')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_obsver=26.0.2
source=("git+${url}.git"
        "obs-studio-${_obsver}.tar.gz::https://github.com/obsproject/obs-studio/archive/${_obsver}.tar.gz")
sha256sums=('SKIP'
            '06eef30156d21f179f590599ab866b7745209045825a3bf8461a85b60d880ed5')

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
