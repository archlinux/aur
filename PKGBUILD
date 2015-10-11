pkgbase=python-cgroupspy-git
pkgname=(python-cgroupspy-git python2-cgroupspy-git)
_username=cloudsigma
_reponame=cgroupspy
pkgver=r29.9186bc6
pkgrel=1
pkgdesc="Python library for managing cgroups. Development version."
arch=('any')
url="https://github.com/cloudsigma/cgroupspy"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=()
optdepends=()
source=("git+https://github.com/$_username/$_reponame.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -r $_reponame{,-py2}
}

build() {
  cd "$srcdir/$_reponame"
  python setup.py build

  cd "$srcdir/$_reponame-py2"
  python2 setup.py build
}

package_python-cgroupspy-git() {
  depends=('python')
  provides=('python-cgroupspy')
  conflicts=('python-cgroupspy')

  cd "$srcdir/$_reponame"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-cgroupspy-git() {
  depends=('python2')
  provides=('python2-cgroupspy')
  conflicts=('python2-cgroupspy')

  cd "$srcdir/$_reponame"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
