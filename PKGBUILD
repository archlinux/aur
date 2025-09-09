# Maintainer: Boris Yumankulov <boriabloger[at]protonmail[dot]com>

pkgname=portprotonqt
pkgver=0.1.5
pkgrel=2
pkgdesc="Modern GUI for managing and launching games from PortProton, Steam, and Epic Games Store"
arch=('any')
url="https://git.linux-gaming.ru/Boria138/PortProtonQt"
license=('GPL-3.0')
depends=('python-numpy' 'python-requests' 'python-babel' 'python-evdev' 'python-pyudev' 'python-orjson'
    'python-psutil' 'python-tqdm' 'python-vdf' 'pyside6' 'icoextract' 'python-pillow' 'perl-image-exiftool' 'xdg-utils' 'python-beautifulsoup4' 'python-websocket-client')
makedepends=('python-'{'build','installer','setuptools','wheel'})
source=("git+https://git.linux-gaming.ru/Boria138/PortProtonQt#tag=v$pkgver"
        "fix_setuptools.patch")
sha256sums=('e95cbac970d3974d079289dceb0ec4c17c5cf72366016057d4231f428acd47eb'
            '06226bf519be70a5e9b831979fbb9f6d8b34a8f686f598187233635269dbf5f4')

prepare() {
    cd "$srcdir/PortProtonQt"
    patch -p1 -i ${srcdir}/fix_setuptools.patch
}

build() {
    cd "$srcdir/PortProtonQt"
	python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/PortProtonQt"
    python -m installer --destdir="$pkgdir" dist/*.whl
    cp -r build-aux/share "$pkgdir/usr/"
}
