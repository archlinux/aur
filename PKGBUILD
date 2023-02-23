# Maintainer: Giacomo Vercesi <mrjackv at hotmail dot it>
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-mbstrdecoder
_pkg="${pkgname#python-}"
pkgver=1.1.2
pkgrel=1
pkgdesc='Multi-byte character string decoder'
arch=('any')
url='https://github.com/thombashi/mbstrdecoder'
license=('MIT')
depends=('python-chardet')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=(
# 'python-pytest' 'python-pytest-runner' 'python-pytest-md-report'
# 'python-faker')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/$_pkg/$_pkg-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/m/$_pkg/$_pkg-$pkgver.tar.gz.asc")
sha256sums=('c3a258e5e00192281eb774c00637f68d2d460854cea0c5c820aa241732aa0b51'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367') ## Tsuyoshi Thombashi

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

## Cannot run tests due to circular dependencies
## python-pytest-md-report depends on this package
# check() {
#   cd "mbstrdecoder-$pkgver"
#   python setup.py pytest
# }

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
