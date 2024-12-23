# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: RubenKelevra

_pyname=htmllistparse
pkgname=python-htmllistparse
pkgver=0.6.1
pkgrel=3
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
sha256sums=('6dc8a6bf03c843b9d325843a26a2351a795b573cd92a2c9b8271621019c64082')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
