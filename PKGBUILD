# Maintainer: Lex Black <autumn-wind@web.de>

_module=configula
pkgname=python-${_module}
pkgver=0.5.2
pkgrel=2
pkgdesc="creates config for papermerge-core"
arch=(any)
url="https://github.com/papermerge/configula"
license=(Apache)
depends=(python-tomlkit)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module//-/_}-$pkgver.tar.gz
        001_files-in-base.patch)
sha256sums=('d293087a584ff94c48b96b9bb0b1ae9cbc61ed1efdacd6bf66ffd750c91d900a'
            'ebf889321789bd70fe010518a57a42df47ac4ca964fcd02d6cc8d7a145aca43a')


prepare() {
  cd "${_module//-/_}-${pkgver}"
  # Without this patch files would get installed into base site-packages dir
  patch -Np1 -i "${srcdir}"/001_files-in-base.patch
}

build() {
  cd "${_module//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
