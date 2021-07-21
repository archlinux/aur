# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=pyd2v
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.3.0.6.g4161694
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=180426'
license=('GPL')
depends=('vapoursynth')
makedepends=('git'
             'python-setuptools'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/rlaPHOENiX/pyd2v.git"
        'setup.py'
        )
sha256sums=('SKIP'
            'fd83e9ba64f74d5f4723050495d8e7388241a8fa2a00c7d8c34e7ba0c6e6a77f'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  _pkgver=$(pkgver)
  cp setup.py "${_plug}/setup.py"
  sed "s|%%VERSION%%|${_pkgver:0:5}|g" -i "${_plug}/setup.py"

}

package() {
  cd "${_plug}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
