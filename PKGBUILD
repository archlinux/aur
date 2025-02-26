#Maintainer:	MajorX234 <majorx234@googlemail.com>
pkgname=isd
pkgdesc="TUI for systemd"
pkgver=0.5.1
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
sha256sums=('1f98f078c4769fa59f46d88c6b89150dd04ab49c22cc5c5deeff51ec2a01ad6b')

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
