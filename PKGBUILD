# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=fgivenx
pkgname=python-$_pkgname-git
pkgver=r294.6de719a
pkgrel=1
pkgdesc="Functional Posterior Plotter"
arch=('any')
url="https://github.com/williamjameshandley/fgivenx"
license=('MIT')
groups=()
depends=(python-numpy python-matplotlib python-scipy python-joblib python-mpi4py python-tqdm)
makedepends=(git python-build python-installer python-wheel python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+$url.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
