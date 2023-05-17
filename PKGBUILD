# Maintainer: Jean Schoeller <jean@schoeller.fr>
pkgname="iio-hyprland-git"

_pkgname="iio-hyprland"

pkgbase="iio-hyprland"

pkgver=r27.5c79b98

pkgrel=1.1

pkgdesc="Reads iio-proxy-sensor output to enable automatic touchscreen rotation in Hyprland"

arch=("any")

depends=("iio-sensor-proxy")

makedepends=("meson")

licence="custom"

url="https://github.com/JeanSchoeller/iio-hyprland/"
source=(
    "${_pkgname}::git+${url}"
)
sha1sums=(
    SKIP
)

pkgver() {
    cd "${srcdir}/${_pkgname}"

    # Get the version number.
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    if [ ! -d "${_pkgname}/build" ]; then
    mkdir ${_pkgname}/build
    fi
}

build() {
    cd "$srcdir/$_pkgname"
    meson setup build    
}

package() {
    cd ${_pkgname}/build
    DESTDIR="${pkgdir}" ninja install
}



