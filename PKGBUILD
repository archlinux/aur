# Maintainer:  Anton Kudelin <kudelin at proton dot me>

_pyname=ib-insync
pkgname=python-$_pyname
pkgver=0.9.86
pkgrel=1
pkgdesc='Python sync/async framework for Interactive Brokers API'
arch=(any)
url='https://github.com/erdewit/ib_insync'
license=(BSD)
depends=(python-nest-asyncio python-eventkit python-pandas python-matplotlib)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest-asyncio)
conflicts=($pkgname-git)
source=(https://files.pythonhosted.org/packages/55/bb/733d5c81c8c2f54e90898afc7ff3a99f4d53619e6917c848833f9cc1ab56/${_pyname/-/_}-${pkgver}.tar.gz)
sha256sums=('73af602ca2463f260999970c5bd937b1c4325e383686eff301743a4de08d381e')

build() {
  cd "${srcdir}/${_pyname/-/_}-${pkgver}"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

package() {
  cd "${srcdir}/${_pyname/-/_}-${pkgver}"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  install -Dm755 LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
