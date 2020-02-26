# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsgan
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v1.0.8.r25.8b166f9
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/rlaPHOENiX/VSGAN'
license=('GPL')
depends=('vapoursynth-plugin-mvsfunc-git'
         'python-numpy'
         'python-pytorch'
         )
makedepends=('git'
             'python-setuptools'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/rlaPHOENiX/VSGAN.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  _ver="$(cat setup.py | grep -m1 version | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "v${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${_plug}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
