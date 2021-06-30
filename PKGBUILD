# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>

pkgname=remarshal
pkgver=0.14.0
pkgrel=2
pkgdesc='Convert between CBOR, JSON, MessagePack, TOML, and YAML'
arch=(any)
url="https://github.com/dbohdan/$pkgname"
license=(MIT)
_py_deps=(cbor2
          dateutil
          tomlkit
          u-msgpack
          yaml)
depends=(python "${_py_deps[@]/#/python-}")
makedepends=(python-setuptools)
options=('!emptydirs')
_pkgdir="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_pkgdir.tar.gz")
sha256sums=('16425aa1575a271dd3705d812b06276eeedc3ac557e7fd28e06822ad14cd0667')

build() {
	cd "$_pkgdir"
	python setup.py build
}

package() {
	cd "$_pkgdir"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
