# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
#Contributor Dave <orangechannel@pm.me>

_plug=lvsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.8.4.1.ge11a463
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Irrational-Encoding-Wizardry/lvsfunc'
license=('MIT')
depends=(
  'vapoursynth'
  'vapoursynth-plugin-vsjetpack-git'
  'vapoursynth-plugin-stgfunc-git'
  'python-numpy'
)
optdepends=(
  'vapoursynth-plugin-combmask'
  'vapoursynth-plugin-d2vsource'
  'vapoursynth-plugin-dgdecodenv-bin'
  'vapoursynth-plugin-fmtconv-git'
  'vapoursynth-plugin-knlmeanscl-git'
  'vapoursynth-plugin-lsmashsource-git'
  'vapoursynth-plugin-rgsf-git'
  'vapoursynth-plugin-tivtc-git'
  'vapoursynth-plugin-bilateral-git'
  'vapoursynth-plugin-bm3d-git'
  'vapoursynth-plugin-descale-git'
  'vapoursynth-plugin-eedi3m-git'
  'vapoursynth-plugin-nnedi3cl-git'
  'vapoursynth-plugin-readmpls-git'
  'vapoursynth-plugin-retinex-git'
  'vapoursynth-plugin-continuityfixer-git'
  'vapoursynth-plugin-znedi3-git'
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
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/lvsfunc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cd "${_plug}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${_plug}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
