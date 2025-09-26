# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# shellcheck disable=SC2034,SC2154

pkgname=mdpeditor
pkgver=1.2.5
pkgrel=1
pkgdesc="Easily produce molecular dynamics simulation parameter input for GROMACS."
arch=('any')
url="https://gitlab.com/cblau/mdpeditor"
license=('GPL-3.0-or-later')
depends=(
  'python>=3.8'
  'python-rich'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
b2sums=('b30866263636f1d89a8356e7673a7c8c983ce0251a5ca95b98e2c58bcf94ad08df9b23c039992e455d81de8219ec105ee5dd3c8f251fe0e59362dc2866de097b')

build() {
    cd "$pkgname-$pkgver" || exit 1
    python -m build --wheel --no-isolation
}

check() {
    true
}

package(){
    cd "$pkgname-$pkgver" || exit 1
    python -m installer --destdir="$pkgdir" dist/*.whl
}
