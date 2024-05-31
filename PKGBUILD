# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=python-collectd-transmission
_name=${pkgname#python-}
pkgver=3.3
pkgrel=1
pkgdesc="A python plugin for collectd to get stats from a runnning transmission server"
arch=(any)
url="https://pypi.org/project/collectd-transmission/#description"
license=('ISCL')
depends=('python' 'python-transmissionrpc')
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
source=("${_name//-/_}-$pkgver::git+https://github.com/LevitatingBusinessMan/collectd_transmission.git#branch=bump_transmission_rpc_version")
makedepends=(python-build python-installer python-wheel)

build() {
    cd ${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name//-/_}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
sha256sums=('SKIP')
