# Copy from https://gitlab.archlinux.org/archlinux/packaging/packages/python-xxhash/-/blob/3.2.0-2/PKGBUILD
# Maintainer: miryo <miryo@vcup.moe>

# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pyname=pydal
pkgname="python-${_pyname}-git"
pkgver=v20230521.1.r0.g05557217
pkgrel=1
pkgdesc='A pure Python Database Abstraction Layer'
arch=('any')
url="https://github.com/web2py${pkgname}"
depends=('python')
optdepends=('sqlite' 'mariadb' 'postgresql' 'mssql-server' 'oracle-xe' 'mongodb')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
license=('BSD')
conflicts=('python-pydal')
provides=('python-pydal')
source=("${pkgname}::git+https://github.com/web2py/pydal.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
