# Maintainer: Vyacheslav Konovalov <f4f7l1hvr@relay.firefox.com>

_commit=0814a17600c9807119f04b256e80ff5866fac04b
pkgname=deemix
pkgver=2.0.15
pkgrel=1
pkgdesc='A deezer downloader built from the ashes of Deezloader Remix'
arch=(any)
url='https://git.rip/RemixDev/deemix'
license=('GPL3')
depends=(
    'python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen'
    'python-spotipy' 'python-eventlet' 'python-deezer-py'
)
makedepends=('python-setuptools')
source=("https://git.rip/RemixDev/deemix/-/archive/main/deemix-main-$_commit.tar.gz")
sha512sums=('f8b32242b11e4bfbb261009da586a0d740c83eaeff9365dd8d10861daf4fce7b3e7d6a56be96c1beeb96fc98c44a791d3f896527104d0fa30301d974740a64ab')
_src=deemix-main-$_commit

pkgver() {
    cd $_src
    sed -En 's/^__version__ = "([0-9\.]+)"$/\1/p' deemix/__init__.py | tr -d '\n'
}

build() {
    cd $_src
    python setup.py build
}

package() {
    cd $_src
    python setup.py install --root="$pkgdir" --optimize=1
}
