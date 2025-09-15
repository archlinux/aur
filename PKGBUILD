# Maintainer: Raimar Bühmann <raimar_at_buehmann dot de>

pkgname=python-hoymiles-wifi
pkgver=0.5.1
pkgrel=4
pkgdesc='Commandline tool and library for Hoymiles DTUs with HMS microinverters'
url='https://github.com/suaveolent/hoymiles-wifi'
license=('MIT')
arch=('any')
depends=(
	'python-protobuf'
	'python-crcmod'
	'python-cryptography'
)
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
)
source=(
	"$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('008b5e435081a72f1f987c7f063b965196b12bf6ded942409abd39ef22cf93dc')
build() {
  cd "${pkgname/python-}-$pkgver"
  pushd hoymiles_wifi/protobuf
  ./compile_proto.sh
  popd
  python -m build --wheel --no-isolation
}
package() {
  cd "${pkgname/python-}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

