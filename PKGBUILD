# Contributor: quellen <lodgerz@gmail.com>
_pkgname=amitools
pkgname="$_pkgname-git"
pkgver=0.7.0.r3.gebfe9c7
pkgrel=1
pkgdesc="Various tools for using AmigaOS programs on other platforms"
arch=('i686' 'x86_64')
url="https://github.com/cnvogelg/amitools"
license=('GPL')
depends=(
  'glibc'
  'python'
  'python-lhafile'
)
makedepends=(
  'cython'
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
provides=("$_pkgname")
conflicts=(${provides[@]})

source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g; s/^v//'
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
} 
