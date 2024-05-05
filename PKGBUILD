# Maintainer: Patrik Bachan <patrikbachan at gmail dot com>
pkgname=asammdf-git
pkgver=r4518.edaac991
pkgrel=1
pkgdesc="fast parser and editor for ASAM MDF files including GUI"
arch=('x86_64') # should build any run on any architecture with C compiler, but PKG is them arch. specific
url="https://github.com/danielhrisca/asammdf"
license=('LGPL-3.0-only')
groups=()
provides=('asammdf')
depends=('python' 'python-pandas' 'python-numpy' 'python-numexpr' 'python-cchardet' 'python-chardet'  'python-lz4' 'python-importlib-metadata' 'canmatrix-git'  'hicolor-icon-theme')
makedepends=('git' 'python-setuptools')
optdepends=(
    'python-h5py: for HDF5 export'
    'python-scipy: for Matlab v4 and v5 .mat export'
    'python-hdf5storage: for Matlab v7.3 .mat export'
    'python-fastparquet: for parquet export'
    'python-snappy: snappy export' 
    'python-pyqtgraph: for GUI tool and Signal plotting'
    'python-matplotlib: as fallback for Signal plotting'
    'python-pyqt5: GUI'
    'pyside6: GUI'
    'python-packaging: GUI'
    'python-natsort: GUI'
    'python-lxml: GUI'
    'python-cryptography: encryption'
    'python-keyring: encryption'
    'python-fsspec: filesystem'
)
source=("${pkgname}"'::git+https://github.com/danielhrisca/asammdf.git'
	'asammdf.desktop')
sha1sums=('SKIP'
          '1de91708f408409745be839e42cca1696940df3e')
conflicts=('asammdf')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	desktop-file-install \
		--dir="$pkgdir/usr/share/applications" "$srcdir/asammdf.desktop"
	install -D -m644 "asammdf.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/asammdf.png"
}
