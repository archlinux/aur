# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>

pkgname=remarshal
pkgver=1.3.0
pkgrel=1
pkgdesc='Convert between CBOR, JSON, MessagePack, TOML, and YAML'
arch=(any)
url="https://github.com/dbohdan/$pkgname"
license=(MIT)
_pydeps=(cbor2
         dateutil
         tomlkit
         u-msgpack
         yaml
         colorama
         rich-argparse
         ruamel-yaml)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-build python-installer python-wheel python-poetry-core)
conflicts=(haskell-yaml)
options=('!emptydirs')
_archive="$pkgname-$pkgver"
# source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('32201c6456aa0d8dc18881c1a7508650635e389ab2e6016a6f5b6934251774c0')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
