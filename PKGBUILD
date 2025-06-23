# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mbake
_pkgname=${pkgname#m}
pkgver=1.2.1
pkgrel=1
pkgdesc='A Python-based Makefile formatter and linter'
arch=(any)
license=(MIT)
url="https://github.com/EbodShojaei/$_pkgname"
_pydeps=(rich
         tomli
         typer)
depends=(python
        "${_pydeps[@]/#/python-}")
makedepends=(git
             python-{build,installer,wheel}
             python-hatchling)
provides=("$_pkgname"
          "python-$_pkgname")
source=("git+$url.git#tag=v$pkgver")
sha256sums=('659c20bfe8486dde6e199d15b58f57010d9929680257c5f749fcbce403b66f7c')

build() {
	cd "$_pkgname"
	python -m build -wn
}

package () {
	cd "$_pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	# So we don't conflict with ruby-bake
	rm -f "$pkgdir/usr/bin/bake"
}
