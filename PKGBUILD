# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=FoundryTools-CLI
pkgname=ftcli
pkgver=2.0.4
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
             python-uv-build)
_archive="$_upname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('8fea2e61f719593cb107d264573a4ad112ee9a91ed879445d8cff8b0d92b9436')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgbase/usr/share/licenses/$pkgname/" LICENSE
}
