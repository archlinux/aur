# Maintainer: Xubai Wang <18016038327@189.cn>
pkgname=python-striprtf-git
_name="striprtf"
pkgver=v0.0.29.r0.g6365066
pkgrel=1
pkgdesc="Stripping rtf to plain old text"
arch=('any')
url="https://github.com/joshy/striprtf"
license=('BSD-3-Clause')
depends=('python>=3.8')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
source=("git+https://github.com/joshy/striprtf.git#branch=master")
sha256sums=('SKIP')
provides=("python-striprtf")
conflicts=("python-striprtf")

pkgver() {
  cd "$_name"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_name}" clean -dfx
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}

