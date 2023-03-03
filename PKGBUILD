# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=namcap-improved
_pkgname=namcap
pkgver=3.3.1+r41+gf84f3c4
pkgrel=1
pkgdesc="Improved Pacman package analyzer"
arch=('any')
url='https://gitlab.archlinux.org/pacman/namcap'
license=('GPL')
depends=('python' 'pyalpm' 'licenses' 'binutils' 'elfutils' 'pkgconf' 'python-pyelftools')
#checkdepends=('systemd' 'python-pytest' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
conflicts=("namcap=$pkgver")
provides=("namcap")
_commit=f84f3c4a847826ef2aa901a3b145faef5b81e79b
source=("git+https://gitlab.archlinux.org/pacman/namcap.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # pydepends: Various improvements
  git cherry-pick -n d00aa49b3e49bff80697ac501bc6d079723c9414

  # externalhooks: Show hook/package name in warning message
  git cherry-pick -n 9f1730b132adc7723d8878b1b29d3d87a22099a5
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
