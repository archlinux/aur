# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=python-piscat-git
_name=PiSCAT
pkgver=r429.b9946cb
pkgrel=1
pkgdesc="Python Package for Interferometric Scattering Microscopy"
arch=('any')
url="https://github.com/SandoghdarLab/PiSCAT"
license=('GPL-3.0-only')
depends=(
	'python-gitpython'
	'python-pyqt6'
	'python-pyqt5-webengine'
	'pyside6'
	'python-astropy'
	'python-h5py'
	'python-ipywidgets'
	'python-joblib'
	'python-matplotlib'
	'python-networkx'
	# notebook
	'python-numba'
	'python-numpy'
	'python-opencv'
	'python-pandas'
	'python-psutil'
	'python-pyqtgraph'
	'python-requests'
	'python-scikit-learn'
	'python-scipy'
	'python-tensorflow'
	'python-tqdm'
	'python-looseversion'
	# from the AUR
	'python-flifile'
	'python-scikit-image'
	'python-tifffile'
	'python-trackpy'
	'python-wget'
	'python-pywavelets'
	'python-imageio-ffmpeg'
)
makedepends=(
	'git'
	'python-build'
	'python-hatchling'
	'python-installer'
	'python-wheel'
	'python-setuptools'
	'python-pytest'
)

source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd ${_name}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_name}
	python -m build --wheel --no-isolation
}

#check() {
#	cd ${_name}
#	python -m pytest piscat tests
#}

package() {
	cd ${_name}
	python -m installer --destdir="$pkgdir" dist/*.whl
}
