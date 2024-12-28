# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname="ansible_dev_environment"
pkgname="ansible-dev-environment"
pkgver=24.12.0
pkgrel=1
pkgdesc="A pip-like install for ansible collections."
arch=('x86_64')
url="https://github.com/ansible/ansible-dev-environment"
license=('GPLv3')
depends=(python python-{jsonschema,onigurumacffi} ansible-{core,runner} git)
makedepends=(python-{build,installer,pip,setuptools,setuptools-scm,wheel})
checkdepends=('python-pytest')
optdepends=('ansible: check official ansible collections')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/37/fb/abfe9e73f575deb44a266de220ff0c9ba4c12dac8e875e395f49ab17320e/ansible_dev_environment-24.12.0.tar.gz")
sha256sums=('1a6169486c2f2c3a450b52518a7356ae026443460cf32bbd7ee1fce02befd596')

build() {
  cd "${srcdir}"
  ln -sf "${_pkgname}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" ${srcdir}/${pkgname}-${pkgver}/dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
