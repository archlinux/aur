# Maintainer: Boris Yumankulov <boriabloger[at]protonmail[dot]com>

pkgname=portprotonqt
pkgver=0.1.9
pkgrel=2
pkgdesc="Modern GUI for managing and launching games from PortProton, Steam, and Epic Games Store"
arch=('any')
url="https://git.linux-gaming.ru/Boria138/PortProtonQt"
license=('GPL-3.0')
depends=('python-numpy' 'python-requests' 'python-babel' 'python-evdev' 'python-pyudev' 'python-orjson'
         'python-psutil' 'python-tqdm' 'python-vdf' 'pyside6' 'python-rapidfuzz' 'icoextract' 'python-pillow'
         'perl-image-exiftool' 'xdg-utils' 'python-beautifulsoup4'
         'python-websocket-client' 'cabextract' 'unzip' 'curl' 'unrar')
makedepends=('python-'{'build','installer','setuptools','wheel'})
source=("git+https://git.linux-gaming.ru/Boria138/PortProtonQt#tag=v$pkgver")
sha256sums=('ef803b9e7e92ec56f42d880ac21c33b1d2719a862a84069ae13a56fe5766fa7a')

build() {
    cd "$srcdir/PortProtonQt"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/PortProtonQt"
    python -m installer --destdir="$pkgdir" dist/*.whl
    cp -r build-aux/share "$pkgdir/usr/"
    cp -r build-aux/lib "$pkgdir/usr/"
}
