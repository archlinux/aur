# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vardefunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r327.8d4b125
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Ichunjo/Vardefunc'
license=('GPL')
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
         'vapoursynth-plugin-debandshit-git'
         )
makedepends=('git'
             'python-setuptools'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Ichunjo/Vardefunc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
