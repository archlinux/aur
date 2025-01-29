#Maintainer:	MajorX234 <majorx234@googlemail.com>
pkgname=isd
pkgdesc="TUI for systemd"
pkgver=0.3.0
pkgrel=2
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
sha256sums=('8d946c667571ac09e7ca394312be98c4cb2e0acb93d4407248df201e3d9bb611')

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
