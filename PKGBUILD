pkgname=python-valve-git
_gituser=Holiverh
_gitrepo=python-valve
_pypiname=valve
pkgver=r110.58788a5
pkgrel=1
pkgdesc="A Python library that provides an all-in-one interface to various Valve products and services."
arch=('any')
url="https://github.com/Holiverh/python-valve"
license=('MIT')
depends=('python' 'python-requests' 'python-six' 'python-setuptools')
optdepends=()
provides=('python-valve')
conflicts=('python-valve')
source=("git+https://github.com/$_gituser/$_gitrepo.git")
sha512sums=(SKIP)

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitrepo"
  rm -rf tests
}

build() {
  cd "$srcdir/$_gitrepo"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitrepo"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
