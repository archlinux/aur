pkgname="python-build123d-git"
pkgdesc="A python CAD programming library -- from git"
pkgver=0.10.0.r377.4536d3d3
pkgrel=1
arch=('any')
url="https://github.com/gumyr/build123d"
license=('Apache-2.0')
depends=(
python-ocp
python-lib3mf
python-typing_extensions
python-numpy
python-svgpathtools
python-anytree
python-ezdxf
ipython
python-ocpsvg
python-ocp_gordon
python-trianglesolver
python-sympy
python-scipy
python-scikit-learn
python-webcolors
)
makedepends=(
git
python-setuptools-scm
python-build
python-installer
python-wheel
)
checkdepends=(
python-pytest
ttf-ms-fonts
)
provides=(python-build123d)
conflicts=(python-build123d)
source=(
"git+https://github.com/gumyr/build123d.git"
)
b2sums=('SKIP')

pkgver() {
	cd build123d
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g')"
}

prepare() {
	cd build123d
}

build() {
	cd build123d
	python -m build --wheel --no-isolation
}

check() {
        python -m venv --without-pip --system-site-packages --clear venv
        source venv/bin/activate
        python -m installer build123d/dist/*.whl
	cd build123d
        python -m pytest
        deactivate
}

package() {
	cd build123d
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
