# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-opentimestamps"
_name="opentimestamps"
pkgver=0.5.0
pkgrel=1
pkgdesc="Python3 library for creating and verifying OpenTimestamps proofs"
arch=("any")
url="https://github.com/opentimestamps/python-opentimestamps"
license=("LGPL-3.0-or-later")
depends=("python" "python-bitcoinlib" "python-pycryptodomex")
optdepends=("python-gitpython: timestamp git commits")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('c38e20e3970b821273c827a14365d3f8542aad390f26f340091daf10d4d2e428')

build(){
 cd "${_name//-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_name//-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
