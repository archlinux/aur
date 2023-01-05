# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vardefunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.7.2.1.g14a6b2a
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Ichunjo/Vardefunc'
license=('MIT')
depends=('python-numpy'
         'vapoursynth-plugin-nnedi3cl-git'
         'vapoursynth-plugin-placebo-git'
         'vapoursynth-plugin-scxvid-git'
         'vapoursynth-plugin-rgsf-git'
         'vapoursynth-plugin-tedgemask-git'
         'vapoursynth-plugin-mvsfunc'
         'vapoursynth-plugin-neo_f3kdb-git'
         'vapoursynth-plugin-lvsfunc-git'
         'vapoursynth-plugin-vsutil-git'
         'vapoursynth-plugin-vsdeband-git'
         )
makedepends=('git'
             'python-pip'
             'python-wheel'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Ichunjo/Vardefunc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_plug}"
  pip wheel --no-deps . -w dist
}

package() {
  cd "${_plug}"
  pip install -I --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
