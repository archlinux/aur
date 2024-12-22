# Maintainer: quietvoid <tcChlisop0@gmail.com>

_plug=awsmfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.3.4.r21.g5c6d78d
pkgrel=1
pkgdesc='Plugin for VapourSynth: awsmfunc (GIT version)'
arch=('x86_64')
url='https://github.com/OpusGang/awsmfunc'
license=('MIT')
depends=('python-numpy'
         'vapoursynth-plugin-subtext'
         'vapoursynth-plugin-vsutil'
         'vapoursynth-plugin-rekt'
         'vapoursynth-plugin-remapframes'
         'vapoursynth-plugin-fillborders')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
optdepends=('vapoursynth-plugin-placebo: VapourSynth placebo plugin'
            'vapoursynth-plugin-descale: VapourSynth descale plugin'
            'vapoursynth-plugin-bilateral'
            'vapoursynth-plugin-fpng')
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
    python -m build --wheel --no-isolation
}

package() {
    cd "${_plug}"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
