pkgname=splatplost-git
_pkgname="splatplost"
pkgdesc="A software-based SplatPost plotter."
pkgver=0.2.0.dev4.a04d5ae
pkgrel=2
arch=('i686' 'x86_64')
conflicts=($_pkgname)
provides=($_pkgname)
url="https://github.com/Victrid/splatplost"
license=('GPL3')
depends=(
	"python-libnxctrl" "python-numpy" "python-pillow" "python-setuptools"
	"python-scipy" "python-tqdm" "python-scikit-image" "python-tsp-solver2"
	"python-pyqt6" "python-requests"
	"bluez-utils" "bluez-deprecated-tools"
)
optdepends=()
makedepends=()
source=('git+https://github.com/Victrid/splatplost.git#branch=dev-v0.2' "setup_config.patch")
sha256sums=('SKIP' "67767ccb5807a2745f7ac32b62aba1cfdb3721b6a48c7ff5b37f550a50495d8e")

prepare() {
	cd $_pkgname
	patch setup.cfg ../setup_config.patch
}

pkgver() {
	cd $_pkgname
	printf "%s.%s" "$(python setup.py --version)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname
	python setup.py install --root="$pkgdir/"  --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
