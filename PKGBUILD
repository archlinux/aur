# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: RubenKelevra

_pyname=htmllistparse
pkgname=python-htmllistparse
pkgver=0.6.0
pkgrel=2
pkgdesc='Python parser for Apache/nginx-style HTML directory listing'
url=https://github.com/gumblex/htmllisting-parser
license=(MIT)
arch=(any)
_pydeps=(beautifulsoup4
         html5lib
         requests
         fusepy)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
depends=(python
         "${_pydeps[@]/#/python-}")
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('9ac274a165a02bf503656df4b48e1ae9eec0df40723a5f998f9023d3df3c8e32')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
