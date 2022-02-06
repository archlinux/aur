# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=debandshit
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v0.4.5.0.g84ae878
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Irrational-Encoding-Wizardry/vs-debandshit'
license=('MIT')
depends=('vapoursynth-plugin-mvsfunc-git'
         'vapoursynth-plugin-vsutil-git'
         'vapoursynth-plugin-fmtconv'
         )
makedepends=('git'
             'python-setuptools'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/vs-debandshit.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package(){
  cd "${_plug}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
