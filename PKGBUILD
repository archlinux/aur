# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
_verbump=dc3d43c57cf3dfc95404f5186c4f466ec88036c0
pkgver=2.1.6
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
sha256sums=('47fa0d072132f2de0bae515cd76e8519eff3e32f2a31b2e50c5c01b8404eee4c'
            'b0a7a2bbd3a3937817b1c2814fb9033df82a2c4983b2e7411da0d09107c2a865')

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
