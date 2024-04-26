# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

_pyname=deepl
pkgname=python-${_pyname}
pkgver=1.18.0
pkgrel=1
pkgdesc='Python library for the DeepL API'
arch=(any)
url="https://github.com/${_pyname}com/${_pyname}-python"
license=(MIT)
depends=(python-requests)
makedepends=(git 
             python-{build,installer,wheel}
             python-poetry-core)
optdepends=('python-keyring: for support storing API Key')
source=("git+$url.git?signed#tag=v$pkgver")
validpgpkeys=('D84A62C6CA4D3E3D6656083438FCACAAFD2C06B8'  # Jan Ebbing <Jan.Ebbing@deepl.com>
              'DBDC63E97C526204335805941FA7A782EC90634E') # Daniel Jones <daniel.jones@deepl.com>
sha256sums=('0415f099b8b55705c83ab44f99b82c253fd50110ff452fd0253ef59e3b4b4078')

build() {
	cd "$_pyname-python"
	python -m build -wn
}

package() {
	cd "$_pyname-python"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
