# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsmasktools
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.9.2.2.gbb3fc6d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Irrational-Encoding-Wizardry/vs-masktools'
license=('MIT')
depends=('vapoursynth-plugin-vstools-git'
    'vapoursynth-plugin-vskernels-git'
    'vapoursynth-plugin-vsexprtools-git'
    'vapoursynth-plugin-vsrgtools-git'
)
makedepends=('git'
    'python-pip'
    'python-wheel'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/vs-masktools.git")
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
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
