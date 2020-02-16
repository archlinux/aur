# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=karma-git
_pkgname=karma
pkgver=r26.7cddd82
pkgrel=1
pkgdesc="Search of Emails and Passwords on Pwndb"
arch=('any')
url="https://github.com/decoxviii/karma"
license=('MIT')
depends=('python' 'python-docopt' 'python-requests' 'python-pysocks' 'python-texttable')
makedepends=('git')
provides=("karma")
conflicts=("karma")
install=
source=("${_pkgname}::git+https://github.com/decoxviii/karma.git"
	"path_change.patch")
sha256sums=('SKIP'
            '9bb89f46926ee4822019640f7b5823eb8776d7ea84b99162e8256eab18dd47de')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  # Adjust path declaration
  patch -i path_change.patch "${_pkgname}/bin/karma"
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

