# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=vampy-host
pkgname="${_pkgname}-git"
pkgver=v1.0.2+12+gb43546b
pkgrel=1
pkgdesc="Wrapper plugin that enables you to use Python Vamp in any Vamp host."
arch=('x86_64'
      'i686'
      'pentium4')
url="https://code.soundsoftware.ac.uk/projects/pyin"
_url="https://github.com/c4dm/${_pkgname}"
_sdk_url="https://github.com/c4dm/vamp-plugin-sdk"
license=('GPL')
depends=(vamp-plugin-sdk python python2)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${_url}")
sha256sums=(
  'SKIP'
  ) 

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

package() {
	cd "${_pkgname}"
        git clone "${_sdk_url}"
        python setup.py build_ext
        python3 setup.py install --root="${pkgdir}" --optimize=1
}
