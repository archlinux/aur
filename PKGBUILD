# Maintainer: Boris Yumankulov <boriabloger[at]protonmail[dot]com>

pkgname=portprotonqt
pkgver=0.1.10
pkgrel=1
pkgdesc="Modern GUI for managing and launching games from PortProton, Steam, and Epic Games Store"
arch=('any')
url="https://git.linux-gaming.ru/Boria138/PortProtonQt"
license=('GPL-3.0')
depends=('python-requests' 'python-libarchive-c' 'python-babel' 'python-evdev' 'python-pyudev' 'python-orjson'
         'python-psutil' 'python-tqdm' 'python-vdf' 'pyside6' 'python-rapidfuzz' 'icoextract' 'python-pillow'
         'perl-image-exiftool' 'xdg-utils' 'python-beautifulsoup4'
         'python-websocket-client' 'cabextract' 'unzip' 'curl' 'unrar')
makedepends=('python-'{'build','installer','setuptools','wheel'})
source=("git+https://git.linux-gaming.ru/Boria138/PortProtonQt#tag=v$pkgver")
sha256sums=('e6ca70da4b028cce85e1477063cf84e1a5bd16f4be14aad607fa7b2c4fc0a7fa')

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
