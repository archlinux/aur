# Maintainer: xiota / aur.chaotic.cx
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

_pkgname="python-ssdeep"
pkgname="$_pkgname-git"
pkgver=3.4.1.r12.g624ac7b
pkgrel=1
pkgdesc='Python wrapper for ssdeep fuzzy hashing library'
arch=('i686' 'x86_64')
url='https://github.com/DinoTools/python-ssdeep'
license=('LGPL3')

depends=(
  'python-cffi'
  'ssdeep'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-runner'
  'unzip'
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  provides=("$_pkgname")
  conflicts=("$_pkgname")
fi

source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --no-isolation --wheel
}

check() {
  cd "$srcdir/$_pkgname"
  unzip dist/*.whl
  pytest
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
