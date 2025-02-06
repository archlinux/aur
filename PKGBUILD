#Maintainer:	MajorX234 <majorx234@googlemail.com>
pkgname=isd
pkgdesc="TUI for systemd"
pkgver=0.4.1
pkgrel=1
arch=("any")
url="https://github.com/isd-project/isd"
license=("GPL3")
provides=(isd)
conflicts=("${pkgname}-git")

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
  python-hatchling
)

source=("https://github.com/isd-project/isd/archive/refs/tags/v${pkgver}.zip")
sha256sums=('f27dd52a17a220fa1ef99a6e9ff2edceda3421cfc09a1e1c991cfcbe3bc5e18f')

build() {
  cd ${srcdir}/"$pkgname"-"$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/"$pkgname"-"$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
