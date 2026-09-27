# Maintainer: Mark Collins
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

_name='unittest-xml-reporting'
_usname="${_name//-/_}"
pkgname="python-${_name}"
pkgver=4.0.0
pkgrel=1
pkgdesc='unittest-based test runner with Ant/JUnit like XML reporting.'
arch=('any')
url="https://github.com/xmlrunner/${_name}"
license=('BSD-2-Clause')
depends=(
  'python'
  'python-lxml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('bfa1ed65e9e6f33c161d04470d89050458cfb65a5a5d0358834ef7ce037d9136')

build() {
    cd "${_usname}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_usname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
    install -Dm755 -t "${pkgdir}/usr/share/licenses/$pkgname" LICENSE
}
