# Maintainer: MalusVeritas <malusveritas[att]riseup[dott]net>

_plug=awsmfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r168.11af7cb
pkgrel=1
pkgdesc='Plugin for VapourSynth: awsmfunc (GIT version)'
arch=('x86_64')
url='https://git.concertos.live/AHD/awsmfunc'
license=('GPL')
depends=('vapoursynth-plugin-vsutil'
         'vapoursynth-plugin-rekt'
         'vapoursynth-plugin-remapframes'
         'vapoursynth-plugin-fillborders'
         'python-numpy')
makedepends=('git'
             'python-setuptools')
optdepends=('vapoursynth-plugin-placebo: VapourSynth placebo plugin'
            'vapoursynth-plugin-descale: VapourSynth descale plugin')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://git.concertos.live/AHD/awsmfunc.git")
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
