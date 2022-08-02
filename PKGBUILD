# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Dan Foreman-Mackey

pkgname='python-emcee-git'
_name="${pkgname%-git}"
pkgver=v2.2.1.r0.g67c8f79
pkgrel=1
pkgdesc="The Python ensemble sampling toolkit for affine-invariant MCMC"
arch=('any')
url="https://github.com/dfm/emcee.git"
license=('MIT')
depends=('python-numpy')
makedepends=('git' 'python-setuptools')
checkdepends=('python-nose' 'python-pytest' 'python-scipy' 'python-h5py')
#source=("${_name}::git+${url}#tag=v3.0rc2")
source=("${_name}::git+${url}#tag=v2.2.1")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_name
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir"/$_name
  python setup.py build
}

check() {
  #python -c 'import emcee; emcee.test()'
  cd "$srcdir"/$_name/emcee
  nosetests -v || warning 'Tests failed'
}

package() {
  cd "${_name}"
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
