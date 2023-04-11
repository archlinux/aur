# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=addnoise
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=3.0.gcd48f73
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/wwww-wwww/vs-noise'
license=('GPL-3.0')
depends=('vapoursynth'
)
makedepends=('git'
    'meson'
    'ninja'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/wwww-wwww/vs-noise.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_plug}"
    echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    arch-meson "../${_plug}" --libdir /usr/lib/vapoursynth
    ninja
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install

    install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
