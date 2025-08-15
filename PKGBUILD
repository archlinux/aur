pkgname=python-beancount-china-importers
pkgver=r161.b6dc785
pkgrel=1
pkgdesc='Beancount importers for services frequently used in China'
arch=('x86_64')
makedepends=(git python-build python-installer python-wheel python-flit-core)
depends=(beancount python-pymupdf python-beautifulsoup4)
url="https://github.com/jiegec/china_bean_importers"
commit=b6dc785272fd18a7df823e311019f51787a25638
source=("git+https://github.com/jiegec/china_bean_importers.git#commit=$commit")

sha256sums=('SKIP')

pkgver() {
    cd "china_bean_importers"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "china_bean_importers"
    git clean -dfx
}

build() {
    cd "china_bean_importers"
    python -m build --wheel --no-isolation
}

package() {
    cd "china_bean_importers"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

