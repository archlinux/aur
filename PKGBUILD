# Maintainer: BrainDamage

pkgname=python-libdecsync
pkgver=2.1.0_1
pkgrel=2
pkgdesc="python3 wrapper around libdecsync"
arch=('x86_64')
url="https://github.com/39aldo39/libdecsync-bindings-python3"
license=('GPL')
depends=('python' 'libdecsync')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('ad777c8126a99cf65ecd6362da79ade69cd2d2d575bb732493454abeb5dc1c3f')

_dirname="libdecsync-bindings-python3-${pkgver//_/-}"

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
