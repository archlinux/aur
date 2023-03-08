# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=namcap-improved
_pkgname=namcap
pkgver=3.3.1+r43+gb6265a7
pkgrel=4
pkgdesc="Improved Pacman package analyzer"
arch=('any')
url='https://gitlab.archlinux.org/pacman/namcap'
license=('GPL')
depends=('python' 'pyalpm' 'licenses' 'binutils' 'elfutils' 'pkgconf' 'python-pyelftools')
#checkdepends=('systemd' 'python-pytest' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
conflicts=("namcap=$pkgver")
provides=("namcap")
_commit=b6265a735c722d39f223177119988153cfe07aed
source=("git+https://gitlab.archlinux.org/pacman/namcap.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # pydepends: Various improvements
  git cherry-pick -n 5483c0d3b1764b5fdd2f37aa7ab6740a38b59cdd

  # pcdepends: fix searching pc files
  git cherry-pick -n f6af2776319fccb4fadcf5415d6c3665b1a9d651
}

build() {
  cd $_pkgname
  python setup.py build
}

#check() {
#  cd $_pkgname
#  env PARSE_PKGBUILD_PATH="${srcdir}/$_pkgname" \
#      PATH="${srcdir}/$_pkgname/scripts:$PATH" \
#      pytest
#}

package() {
  cd $_pkgname
  python setup.py install --root="${pkgdir}"
}
