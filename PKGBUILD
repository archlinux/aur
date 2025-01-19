pkgname=isd
pkgdesc="TUI for systemd"
pkgver=0.1.0
pkgrel=1
arch=("x86_64" "arm7h")
url="https://github.com/isd-project/isd"
license=("Unlicense")
provides=(isd)

depends=(python
  systemd
  python-xdg-base-dirs  
  python-pfzy         
  python-textual          
  python-pydantic-settings        
  python-pydantic          
  python-types-pyyaml
  python-hatchling
)
makedepends=(
  python
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-xdg-base-dirs
  python-pfzy
  python-textual
  python-pydantic-settings
  python-pydantic
  python-types-pyyaml
)

source=("https://github.com/isd-project/isd/archive/refs/tags/v${pkgver}.zip")
sha256sums=('7cd1dbeb9f24f95b2bbb83109e866250f1430f05f4267039779492b567a6e7f9')

build() {
  cd ${srcdir}/"$pkgname"-"$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/"$pkgname"-"$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
