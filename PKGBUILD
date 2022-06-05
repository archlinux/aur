# Maintainer: quietvoid <tcChlisop0@gmail.com>

_plug=awsmfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.3.2.r3.g41cf38e
pkgrel=1
pkgdesc='Plugin for VapourSynth: awsmfunc (GIT version)'
arch=('x86_64')
url='https://github.com/OpusGang/awsmfunc'
license=('MIT')
depends=('python-numpy'
         'vapoursynth-plugin-vsutil'
         'vapoursynth-plugin-rekt'
         'vapoursynth-plugin-remapframes'
         'vapoursynth-plugin-fillborders')
makedepends=('git'
             'python-setuptools')
optdepends=('vapoursynth-plugin-placebo: VapourSynth placebo plugin'
            'vapoursynth-plugin-descale: VapourSynth descale plugin')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/OpusGang/awsmfunc.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_plug}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_plug}"
    python setup.py build
}

package() {
    cd "${_plug}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
