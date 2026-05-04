# Maintainer: quietvoid <tcChlisop0@gmail.com>

_plug=fpng
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r15.50c628e
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Mikewando/vsfpng'
license=('LGPL')
depends=('vapoursynth')
makedepends=('git' 'meson-python')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Mikewando/vsfpng.git")
b2sums=('SKIP')

pkgver() {
  cd "${_plug}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_plug}"

  python -m build --wheel --no-isolation
}

package(){
  cd "${_plug}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
