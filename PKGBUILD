# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

_pkgname=python-ssdeep
pkgname=$_pkgname-git
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
  'python-pip'
  'python-setuptools'
)
checkdepends=('python-pytest')
provides=(${_pkgname})
conflicts=(${provides[@]})
source=("$_pkgname"::"git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname"
  python setup.py test
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root=${pkgdir} --optimize=1
}
