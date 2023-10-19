# Maintainer: cnf3rd <subs.in.tokyo@gmail.com>

_plug=vssource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.9.5.3.ge2220bf
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Irrational-Encoding-Wizardry/vs-source.git'
license=('GPL')
depends=(
  'vapoursynth'
  'vapoursynth-plugin-vstools'
  'vapoursynth-plugin-bestsource'
  'vapoursynth-plugin-lsmashsource'
  'vapoursynth-plugin-d2vsource'
  'vapoursynth-plugin-dgdecodenv'
  'vapoursynth-plugin-imwri'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/vs-source.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cd "${_plug}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_plug}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
