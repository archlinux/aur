# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
_verbump=fc768fa3ea929dc1ca668f6d1a2cc66940650333
pkgver=2.1.5
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
sha256sums=('c78b37f7d9db3311ddff6d11c460acb127b8143e87941f0f09fd1538492fed82'
            'eb5c43ae3c3d8dbca9bd96d13107e044184b0d4455eeae87c890e87e0be3f22a')

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
