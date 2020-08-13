# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=sfdnormalize
pkgname=$_pipname-git
pkgver=0.3.0.r1.g63c0888
pkgrel=1
pkgdesc='SFD normalizer, discards GUI information from SFD files'
arch=('any')
url="https://github.com/alerque/$_pipname"
license=('CCO')
depends=('python')
makedepends=('python-setuptools')
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
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
