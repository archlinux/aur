# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=sfdnormalize
pkgname=$_pipname-git
pkgver=1.1.1.r0.g818355c
pkgrel=2
pkgdesc='SFD normalizer, discards GUI information from SFD files'
arch=(any)
url="https://github.com/alerque/$_pipname"
license=(CCO)
depends=(python
         python-sfdutf7)
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python -m build -wn
}

package() {
	cd "$pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
}
