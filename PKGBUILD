# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsengine
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.2.0.4.gc2bde81
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-engine'
license=('MIT')
depends=('vapoursynth'
)
makedepends=('git'
    'python-pip'
    'python-wheel'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Jaded-Encoding-Thaumaturgy/vs-engine.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_plug}"
    echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
    cd "${_plug}"
    pip wheel --no-deps . -w dist
}

package() {
    cd "${_plug}"
    pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
