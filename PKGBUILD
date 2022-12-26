# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=5f978acec7feea53aead493ee2b916ff99a811df
pkgname=deemix
pkgver=3.6.6
pkgrel=3
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://gitlab.com/RemixDev/deemix-py'
license=('GPL3')
depends=(
    'python>=3.7' 'python-click' 'python-pycryptodomex' 'python-mutagen'
    'python-eventlet' 'python-deezer-py>=1.3.0'
)
optdepends=(
    'python-spotipy>=2.11.0: download using metadata from Spotify'
)
makedepends=('python-setuptools')
source=("https://gitlab.com/RemixDev/deemix-py/-/archive/$_commit/deemix-py-$_commit.tar.gz")
sha512sums=('1a252216f5468b37f1e6513d42b0dd37a79dad44d6fd19f621429008b5c4f735d715b74e630aabff0c3fd9336f2a9d2022a6d600e795d6b8b9585bd8830efffa')

pkgver() {
    cd deemix-py-$_commit
    sed -En 's/^__version__ = "([0-9\.]+)"$/\1/p' deemix/__init__.py | tr -d '\n'
}

build() {
    cd deemix-py-$_commit
    python setup.py build
}

package() {
    cd deemix-py-$_commit
    python setup.py install --root="$pkgdir" --optimize=1
}
