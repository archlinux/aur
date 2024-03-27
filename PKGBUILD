pkgname="python-libtimed"
pkgver=0.6.5
pkgrel=1
pkgdesc="Python API for timed"
arch=("any")
url="https://github.com/adfinis/libtimed.git"
license=("AGPL3")
provides=("libtimed")
conflicts=("libtimed")
depends=("python>=3.10" "python-inflection>=0.5.1" "python-requests-cache>=1.1.0")
makedepends=("python-poetry" "python-installer" "git")
source=("git+${url}")
sha256sums=('SKIP')

pkgver(){
  cd "${srcdir}/libtimed"
  git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}

build() {
  cd "${srcdir}/libtimed"
  poetry install
  poetry build
}

package() {
  cd "${srcdir}/libtimed"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
