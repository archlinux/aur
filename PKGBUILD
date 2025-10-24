# Maintainer: Raimar Bühmann <raimar_at_buehmann dot de>

pkgname=python-hoymiles-wifi
pkgver=0.5.3
pkgrel=1
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
sha256sums=('bb26a4ec4afc9e2555fc97bdd4996fb4232c086e8c8b304c2bc1bef8137c0f80')
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

