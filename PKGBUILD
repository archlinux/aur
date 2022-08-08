# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=unblob-git
_pkgname=${pkgname%-git}
pkgver=0.0.0.r859.g6901ae3
pkgrel=1
pkgdesc='Extract files from any kind of container formats'
arch=(any)
url="https://github.com/onekey-sec/$_pkgname"
license=(MIT)
_py_deps=(arpy
          attrs
          click
          cstruct
          dissect.cstruct
          hyperscan
          jefferson
          lark
          lief
          lz4
          plotext
          pluggy
          python-lzo
          python-magic
          rarfile
          structlog
          ubi-reader
          yaffshiv)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(git
             python-{build,installer,wheel}
             python-poetry)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
    git tag v0.0.0 1958a226e2ffe86262ddd5a8e8f87a0f98816cdf^
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	python -m build -wn
}

package() {
	cd "$_pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
