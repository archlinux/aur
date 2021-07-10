# Maintainer: Jaan Toots <jaan@jaantoots.org>
pkgname=python-xdg
_name=${pkgname#python-}
pkgver=5.1.0
pkgrel=1
pkgdesc="Variables defined by the XDG Base Directory Specification"
arch=('any')
url="https://github.com/srstevenson/xdg"
license=('ISC')
depends=('python')
makedepends=('python-setuptools' 'python-dephell')
conflicts=('python-pyxdg')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('3162ec1f612aca656da5b5a956ec40542d119c1f64f51b952d6d71b01ddeedc4')

prepare() {
    cd "$_name-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 644 LICENCE -T "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
