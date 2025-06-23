# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=did
pkgname="python-${_name}-git"
pkgver=0.22.1.r759.64dfd8db
pkgrel=1
pkgdesc='What did you do last week, month, year?'
arch=('any')
url="https://github.com/psss/did"
makedepends=('python-setuptools' 'git')
license=('GPL2')
provides=("python-${_name}")
conflicts=("python-${_name}")
depends=('python')
source=(
  "${_name}::git+${url}.git"
)
sha256sums=(SKIP)

pkgver() {
  cd "${_name}"
  _version=$(python setup.py -V)
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.r%s.%s" "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "${srcdir}/${_name}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

