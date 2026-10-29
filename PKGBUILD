# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-pgsanity"
_name="${pkgname#python-}"
pkgver=0.3.0
pkgrel=2
pkgdesc="Check syntax of sql for PostgreSQL"
arch=(any)
url="https://github.com/markdrago/pgsanity"
license=('MIT')
depends=("python")
makedepends=("python-build" "python-installer" "python-uv-build" "python-wheel")
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('00f28c4eb54a808ca86204ab99e48e007f7fe11d5edfbf8ddec8f8dffa0682975082b81a5615d3bbd470527176e752ad9de7ab4408fc25dfbd250d5ff3bdb66f')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 # upstream pins uv_build<0.9, Arch has a newer one
 python -m build --wheel --no-isolation --skip-dependency-check
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
