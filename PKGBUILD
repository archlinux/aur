# Maintainer: MalusVeritas <malusveritas[att]riseup[dott]net>

_plug=rekt
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r38.3da2b2f
pkgrel=1
pkgdesc='Plugin for VapourSynth: rekt (GIT version)'
arch=('x86_64')
url='https://gitlab.com/Ututu/rekt'
license=('GPL')
depends=('vapoursynth' 'vapoursynth-plugin-vsutil')
makedepends=('git'
             'python-setuptools')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://gitlab.com/Ututu/rekt.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_plug}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_plug}"
    python setup.py build
}

package() {
    cd "${_plug}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
