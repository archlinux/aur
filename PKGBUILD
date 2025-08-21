# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=FoundryTools-CLI
pkgname=ftcli
pkgver=2.0.3
pkgrel=1
pkgdesc='Foundry Tools command line font editor'
arch=(any)
url="https://github.com/ftCLI/$_upname"
license=(MIT)
_pydeps=(click
         loguru
         pathvalidate
         foundrytools
         rich)
depends=(afdko
         python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-hatchling)
_archive="$_upname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('0aa51707dab0240a99e11a9b2d6b6b22e375e7dd871881ec42d34b2d15a0b768')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgbase/usr/share/licenses/$pkgname/" LICENSE
}
