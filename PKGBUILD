# Maintainer: Nevimmu <nevimmu@gmail.com>
pkgname=jams
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="auto-pause your music"
arch=("x86_64")
url="https://github.com/nevimmu/JAMS"
license=("MIT")
groups=()
depends=(
	"python"
	"python-argcomplete"
	"python-dbus"
)
makedepends=(
	"git"
	"python-setuptools"
	"python-build"
	"python-installer"
	"python-wheel"
)
source=(
	"${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz"
	"python-questionary::git+https://aur.archlinux.org/python-questionary.git"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    cd "${srcdir}/python-questionary"
    makepkg -si --noconfirm
}

build() {
	cd "JAMS-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "JAMS-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
