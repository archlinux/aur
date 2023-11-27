# Maintainer: AlphaJack <alpha at tuta dot io>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname="python-opentimestamps-git"
pkgver=0.4.5.r0.ga90094e
pkgrel=2
pkgdesc="Python3 library for creating and verifying OpenTimestamps proofs"
license=("LGPL3")
arch=("any")
provides=("python-opentimestamps")
conflicts=("python-opentimestamps")
url="https://github.com/opentimestamps/python-opentimestamps"
depends=("python-bitcoinlib" "python-pycryptodomex")
makedepends=("git" "python-setuptools" "python-build" "python-installer" "python-wheel")
checkdepends=("python-pytest" "python-gitpython")
source=("git+$url")
b2sums=("SKIP")

pkgver(){
 cd "python-opentimestamps"
 git describe --long --tags | sed 's/^python-opentimestamps-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
 cd "python-opentimestamps"
 python -m build --wheel --no-isolation
}

check(){
 cd "python-opentimestamps"
 pytest
}

package(){
 cd "python-opentimestamps"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
