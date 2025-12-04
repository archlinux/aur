# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>

_plug=dmetrics
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r11.adec0f3
pkgrel=3
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/vapoursynth/dmetrics'
license=('GPL-2.0')
depends=('vapoursynth')
makedepends=(
    'git'
    'meson'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/vapoursynth/dmetrics.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_plug"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    arch-meson "../${_plug}" --libdir /usr/lib/vapoursynth
    ninja
}

package(){
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 "${srcdir}/${_plug}/Copying" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}