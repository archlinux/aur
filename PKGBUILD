# Maintainer: Boris Yumankulov <boriabloger[at]protonmail[dot]com>

pkgname=portprotonqt
pkgver=0.1.9
pkgrel=1
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
sha256sums=('4e10d371b2ee5ce2137953dcc50d0ed2d2bbac573dccdb22382cde1b1afe7122')

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
