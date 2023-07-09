# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
_verbump=51079d4f257c6bcbcf96e82687700a1cabfd2bb5
pkgver=2.1.10
pkgrel=1
pkgdesc="Python CLI and API for talking to Meshtastic devices"
arch=('any')
url="https://github.com/meshtastic/python/"

# https://github.com/meshtastic/python/issues/422
license=('GPL3')

depends=('python-protobuf' 'python-pypubsub' 'python-dotmap' 'python-pyqrcode' 'python-tabulate' 'python-timeago' 'python-pyyaml' 'python-pygatt' 'python-setuptools' 'python-enum-compat' 'python-requests')
optdepends=('python-pytap2: TUN tunnel support')
source=("https://github.com/meshtastic/python/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/meshtastic/python/commit/${_verbump}.patch")
sha256sums=('89317cb285317cbb2115850ccffad8e2ddfb82aacd22e1f8a06c55612411dca1'
            '0286e2ed2f09217c136f5f620b1a048c176cfe69f8be2b24a96dfa39c0de5c66')

prepare() {
    cd "$_name-$pkgver"

    # The tagged commits unfortuantely miss the version bump performed in the
    # release script, so we manually backport that change.
    patch -p1 < "${srcdir}"/${_verbump}.patch
}

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
