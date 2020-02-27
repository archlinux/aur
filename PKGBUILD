# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=pvsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v2.0.6.r42.a0036b3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=180426'
license=('GPL')
depends=('vapoursynth-plugin-havsfunc-git'
         'python-pymediainfo'
         )
makedepends=('git'
             'python-setuptools'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/rlaPHOENiX/pvsfunc.git")
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
