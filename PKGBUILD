# Maintainer: Matej Dujava <mdujava (plus) aur (at) kocurkovo (dot) cz>

pkgname=python-sphinxcontrib-httpdomain
_libname=sphinxcontrib-httpdomain
pkgver='2.0.0'
pkgrel='1'
pkgdesc="HTTP domain extension for sphinx"
arch=('any')
url="https://github.com/sphinx-contrib/httpdomain"
license=('BSD')
makedepends=('python-build' 'python-installer' 'python-uv-build')
depends=('python-sphinx')
source=("https://github.com/sphinx-contrib/httpdomain/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('efe2a0fd3320818db93d7c7045b88c2d2cebd23f2b1b5af974cb3012625f613b')

prepare() {
    cd httpdomain-${pkgver}
    sed -i 's/uv_build >= 0.9.26, <0.10.0/uv_build/' pyproject.toml
}

build() {
    cd httpdomain-${pkgver}
    python -m build --wheel --no-isolation
}

package(){
    cd httpdomain-${pkgver}
    python -m installer --destdir="$pkgdir/" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
