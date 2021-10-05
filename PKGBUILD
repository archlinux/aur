# Maintainer: BrainDamage

pkgname=python-libdecsync
pkgver=2.1.0
pkgrel=1
pkgdesc="python3 wrapper around libdecsync"
arch=('x86_64')
url="https://github.com/39aldo39/libdecsync-bindings-python3"
license=('GPL')
depends=('python' 'libdecsync')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c093f6e6b183b1b76f8a43b602b94fd95352823d5ce97512d4c95a081fcc5af3')

_dirname="libdecsync-bindings-python3-${pkgver}"

build() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_dirname}"
  python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
  # not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
  rm -rf "${pkgdir}/$(python -c 'import site; print(site.getsitepackages()[0])')/tests/"
}
