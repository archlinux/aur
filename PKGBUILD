# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fdiff-git
pkgver=v1.0.2.r8.g4961155
pkgrel=1
pkgdesc='An OpenType table diff tool for fonts based on the fontTools TTX format'
arch=(any)
url="https://github.com/source-foundry/${pkgname%-git}"
license=('MIT')
depends=('python' 'python-aiodns' 'python-aiofiles' 'python-aiohttp' 'python-fonttools>=4.8.1')
makedepends=('python-setuptools')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 HEAD |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
