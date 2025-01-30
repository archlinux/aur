# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-skia-git
_pkgname=skia-python
pkgver=132.b11.r0.gdb7d7fc
pkgrel=1
pkgdesc='Python binding to Skia Graphics Library (wheel)'
arch=(x86_64)
url="https://github.com/kyamagu/$_pkgname"
license=(BSD-3-Clause)
depends=(fontconfig
         opengl-driver
         python
         skia)
makedepends=(git
             python-{build,installer,wheel})
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
_archive="$_pkgname-$pkgver"
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --abbrev=7 --tags --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	python -m build -wn
}

package() {
	cd "$_pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
}
