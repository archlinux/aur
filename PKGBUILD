#Maintainer:	MajorX234 <majorx234@googlemail.com>
pkgname=isd
pkgdesc="TUI for systemd"
pkgver=0.5.0
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
sha256sums=('9fdddab18e1f4080d76a95767ed06799b0cc4c71b2063551f7d2a541d53dc9bb')

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
