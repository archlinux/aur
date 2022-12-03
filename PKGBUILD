# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_namespace="tallero"
_pkgbase="mkaudiocdrimg"
_pkgname="${_pkgbase}"
pkgname="${_pkgbase}-git"
pkgver=1.0+1+g92f8081
pkgrel=1
pkgdesc="Make an audio CD-R image from media files."
arch=('any')
url="https://gitlab.com/${_namespace}/${_pkgbase}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('ffmpeg'
         'shntool'
         'python-appdirs')
makedepends=('git'
             'python-setuptools')
license=("AGPL3")
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

package() {
  cd "${_pkgname}" || exit
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
