pkgname=python-cymbal-git
_module='cymbal'
pkgver=r11.f0c7e7d
pkgrel=1
pkgdesc="makes it easy to add functionality missing from libclang Python bindings"
url="https://github.com/AndrewWalker/cymbal"
provides=(python-cymbal)
conflicts=(python-cymbal)
depends=(python)
makedepends=(python-setuptools)
license=('MIT')
arch=('any')
source=("git://github.com/AndrewWalker/cymbal.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_module"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_module}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  rm -rf "${pkgdir}/usr/lib/python3.8/site-packages/tests"
}

