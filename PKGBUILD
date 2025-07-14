# Maintainer: ThePirate42 <aur at thepirate42 dot org>

_name=ipycache

pkgname=python-${_name}-git
pkgver=0.1.4.r86.g73b6bec
pkgrel=1
pkgdesc="Defines a %%cache cell magic in the IPython notebook to cache results of long-lasting computations"
arch=('any')
url="https://github.com/rossant/${_name}"
license=('BSD-3-Clause')
provides=(python-${_name})
conflicts=(python-${_name})
depends=(python ipython python-traitlets)
optdepends=('python-cloudpickle: cloudpickle support')
makedepends=(python-build python-installer python-setuptools git)
source=(${_name}::git+${url}.git)
sha512sums=('SKIP')

pkgver(){
  cd "${srcdir}/${_name}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  git -C "${srcdir}/${_name}" clean -dfx
}

build(){
  cd "${srcdir}/${_name}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${srcdir}/${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "${srcdir}/${_name}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
