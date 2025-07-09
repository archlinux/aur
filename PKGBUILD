# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mbake
_pkgname=${pkgname#m}
pkgver=1.2.4
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
provides=("python-$pkgname=$pkgver")
source=("git+$url.git#tag=v$pkgver")
sha256sums=('6ef5b09113db64be2cb95be8562725374d19d527af4789fe33b51db85440bc77')

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
