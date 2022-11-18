# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsdeband
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.5.2.1.gf4f4276
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Irrational-Encoding-Wizardry/vs-deband'
license=('MIT')
depends=('vapoursynth-plugin-mvsfunc-git'
         'vapoursynth-plugin-vsutil-git'
         'vapoursynth-plugin-fmtconv'
         'vapoursynth-plugin-vstools-git'
         'vapoursynth-plugin-vsexprtools-git'
         'vapoursynth-plugin-vskernels-git'
         'vapoursynth-plugin-vsrgtools-git'
         )
makedepends=('git'
             'python-pip'
             'python-wheel'
             'python-setuptools'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}"
          'vapoursynth-plugin-debandshit-git'
          )
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/vs-deband.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
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
