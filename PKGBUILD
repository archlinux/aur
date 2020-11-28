# maintainer: BrainDamage

pkgname=python-radicale-decsync
pkgver=1.1.2
pkgrel=1
pkgdesc="Radicale storage plugin to add synchronization using DecSync "
arch=('any')
url="https://github.com/39aldo39/Radicale-DecSync"
license=('GPL3')
depends=('python' 'python-libdecsync' 'radicale')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2ab7f07e3261433f1f10208b6b1164712a663632e9d00f025493a623145f0be7')

_dirname="Radicale-DecSync-${pkgver}"

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

