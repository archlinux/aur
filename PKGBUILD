# Maintainer: Ricardo Constantino <ricardo@tsu.re>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Samuel Littley <aur@toastwaffle.com>
# Contributor: rnons <remotenonsense at gmail dot com>

pkgname=python-ruyaml
_name=${pkgname#python-}
pkgver=0.91.0
pkgrel=3
pkgdesc="ruyaml is a openly maintained fork of elusive ruamel-yaml package that can be used as as a drop-in replacement."
arch=('any')
url="https://github.com/pycontribs/ruyaml"
license=('MIT')
depends=('python')
makedepends=('python-wheel' 'python-build' 'python-installer' 'python-setuptools-scm')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('32a464327e761d8cb686183f783ee272003560a4d3b3da792d3fdbb10f62674da71c45b392d8c5169f5b7e352086f329a2fd7595e122c57fd95ed4610fad0fa9')

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$_name-$pkgver"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
