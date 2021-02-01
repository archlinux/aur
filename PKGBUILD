# Maintainer: Vyacheslav Konovalov <f4f7l1hvr@relay.firefox.com>

_commit=2c9ed02394f66bf97e74d35e3fe02d0fbb2fd2fe
pkgname=deemix
pkgver=2.0.13
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
sha512sums=('83cba73b9518ab62dcb909f8a44359891410340b9d5e92a2700e2de7d6dbd823df79d138571037a4b45f4e18f5d02f4f809cd7dfe3b1790f640d872cc8fc0754')
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
