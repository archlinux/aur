# Maintainer:  Dave <orangechannel@pm.me>

_plug=placebo
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.0.4.r0.g3cfd23f
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Lypheo/vs-placebo'
license=('LGPL')
depends=('vapoursynth' 'libplacebo')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'meson-python'
  'vulkan-headers'
)
optdepends=('libdovi')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Lypheo/vs-placebo.git")
b2sums=('SKIP')

pkgver() {
  cd "${_plug}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_plug}"

  python -m build --wheel --no-isolation
}

package(){
  cd "${_plug}"
  
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
