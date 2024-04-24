# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
_pkgname=hazwaz
pkgname=python-$_pkgname
pkgver=0.0.3
pkgrel=2
pkgdesc="A python library to write command line scripts"
arch=('any')
url="https://hazwaz.trueelena.org/"
license=(AGPL-3.0-or-later)
depends=('python')
optdepends=('python-coloredlogs: pretty log output')
makedepends=(python-build python-installer python-wheel)
source=("https://git.sr.ht/~valhalla/$_pkgname/archive/v$pkgver.tar.gz" pyproject.toml.patch)
sha256sums=('b71a79e91d4e9420bcc29d67d1b8db26d54954a702ecd0a62d7754a90158fb57'
            'e044804dd39fd283e421b3387462d9faa75cf429b304576a63982393cba64bd4')

prepare() {
  cd "${_pkgname}-v${pkgver}"
  # patch pyproject to not require setuptools-scm to get version
  patch --forward --strip=1 --input=../pyproject.toml.patch
}

build() {
  cd "${_pkgname}-v${pkgver}"
  python -m build -w --skip-dependency-check --no-isolation 
}

package() {
  cd "${_pkgname}-v${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
