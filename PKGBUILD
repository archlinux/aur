# Maintainer: Vyacheslav Konovalov <f4f7l1hvr@relay.firefox.com>

_commit=67fcb7d37f0cd24564b7ff2738cd5e69551edc6d
pkgname=deemix
pkgver=2.0.16
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
sha512sums=('53838d394f29485207a886a78163dabcb483ae64787422bbf7ef735e97e482e3841a21b5517b212833276def231c02f343b1089977cb415983f878a99a545b4d')
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
