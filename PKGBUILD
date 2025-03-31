# Maintainer: Raimar Bühmann <raimar_at_buehmann dot de>

pkgname=python-hoymiles-wifi
pkgver=0.4.0
pkgrel=1
pkgdesc='Commandline tool and library for Hoymiles DTUs with HMS microinverters'
url='https://github.com/suaveolent/hoymiles-wifi'
license=('MIT')
arch=('any')
dependencies=(
	'python-protobuf'
	'python-crcmod'
)
makedepends=(
	'python-setuptools'
	'python-build'
)
source=(
	"$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('e19c7b88b693797c51e85bdfd30f5d4c9f6b17cd6b1aee0b4617936343039bf2')
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

