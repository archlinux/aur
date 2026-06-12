# Maintainer: Yakov Till <yakov.till@gmail.com>

# ------------------------------------------------------------------
# NAMING CONVENTION:
# - Use 'pkgname' (e.g., 'spotify') for proprietary/closed-source 
#   software where no source build is possible.
# - Use 'pkgname-bin' ONLY to distinguish a pre-compiled package 
#   from an existing source-based package (e.g., 'firefox-bin').
# ------------------------------------------------------------------
pkgname=python-kagglesdk
_name=${pkgname#python-}
pkgver=0.1.30
pkgrel=1
pkgdesc="Basic python bindings for Kaggle's external-facing endpoints"
arch=('any')
url="https://github.com/Kaggle/kagglesdk"
license=('Apache')
depends=('python' 'python-requests' 'python-protobuf')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('47c6643066d965b7898e960fddcde07e151bea1ae1c1c381e25a5a041edf881d')

latestver() {
    curl -s "https://pypi.org/pypi/${_name}/json" | jq -r '.info.version'
}

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
