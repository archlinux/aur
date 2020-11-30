# Maintainer: Jaan Toots <jaan@jaantoots.org>
pkgname=python-xdg
_name=${pkgname#python-}
pkgver=5.0.1
pkgrel=1
pkgdesc="Variables defined by the XDG Base Directory Specification"
arch=('any')
url="https://github.com/srstevenson/xdg"
license=('ISC')
depends=('python')
makedepends=('python-setuptools' 'python-dephell')
conflicts=('python-pyxdg')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c3ecc2bae7d1305b2d421deaf61f07d5bda44f68252e499457a5f2dd99b15985')

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
