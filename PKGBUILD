# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>

pkgname=python-opensearch-git
pkgver=3.2.0.r15.gf09f8b0
pkgrel=1
pkgdesc='Python Client for OpenSearch'
arch=('any')
url='https://github.com/opensearch-project/opensearch-py'
license=('Apache-2.0')
conflicts=('python-opensearch')
depends=(
    'python'
    'python-urllib3'
    'python-requests'
    'python-dateutil'
    'python-certifi'
)
makedepends=(
    'git'
    'python-setuptools'
)
optdepends=(
    'python-aiohttp'
)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="${pkgdir}" --optimize=1
}

