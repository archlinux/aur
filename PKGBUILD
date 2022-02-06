# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=pvsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=4.3.0.12.g1f5e44f
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=180426'
license=('GPL')
depends=('vapoursynth-plugin-havsfunc-git'
         'vapoursynth-plugin-pyd2v-git'
         'python-pymediainfo'
         'python-more-itertools'
         )
makedepends=('git'
             'python-poetry'
             'python-pip'
             'python-wheel'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/rlaPHOENiX/pvsfunc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cd "${_plug}"
  poetry build -f wheel
}

package() {
  cd "${_plug}"
  pip install -I --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

  rm -fr "${pkgdir}${_site_packages}"/{README.md,LICENSE}

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
