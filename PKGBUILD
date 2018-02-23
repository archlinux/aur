# Maintainer: aimileus <me at aimileus dot nl>
pkgname=python-snowboy-git
_pkgname=snowboy
pkgver=v1.2.0.r134.g7d20d7f
pkgrel=1
pkgdesc="A hotword detection engine - Python bindings"
arch=('x86_64')
url="https://snowboy.kitt.ai/"
license=('Apache')
depends=(
  'cblas'
  'lapack'
  'python-pyaudio'
)
makedepends=(
  'git'
  'python-setuptools'
  'swig'
)
conflicts=('python-snowboy')
provides=('python-snowboy')
source=("git+https://github.com/Kitt-AI/snowboy.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  sed -i "s|-lf77blas -lcblas -llapack -latlas|-lcblas -llapack|g" \
    swig/Python3/Makefile
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir/" --prefix=/usr
}
