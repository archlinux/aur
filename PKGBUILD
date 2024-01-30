# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=python-pyarabic
_name=${pkgname#python-}
pkgver=0.6.16
pkgrel=2
pkgdesc="Arabic language library for Python"
arch=('any')
url="https://github.com/linuxscout/pyarabic"
license=('GPL-3.0-or-later')
depends=('python' 'python-six' 'python-sphinx_rtd_theme')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('ec8c3a492e11969d03bf937d2bc6ee4aae2fc9c922208021922545d5738dcdff')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dvm644 *.md *.pdf doc/* docs/* CREDITS -t "$pkgdir"/usr/share/doc/$pkgname/
}
