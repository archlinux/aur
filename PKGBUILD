# Maintainer: dringsim <dringsim@qq.com>
# Contributor: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=calysto_prolog
pkgname=jupyter-${_pkgname}-git
pkgver=r10.1e6f292
pkgrel=2
pkgdesc="A Prolog kernel for Jupyter (GIT version)"
arch=('any')
url="https://github.com/Calysto/calysto_prolog"
license=('BSD')
depends=('jupyter-metakernel')
makedepends=('python-setuptools')
source=("git+https://github.com/Calysto/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package(){
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
  python calysto_prolog/__main__.py install --prefix="$pkgdir/usr"
}

# vim:ts=2:sw=2:et:
