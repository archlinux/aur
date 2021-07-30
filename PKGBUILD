# Maintainer: Jaan Toots <jaan@jaantoots.org>
pkgname=python-xdg
_name=${pkgname#python-}
pkgver=5.1.1
pkgrel=1
pkgdesc="Variables defined by the XDG Base Directory Specification"
arch=('any')
url="https://github.com/srstevenson/xdg"
license=('ISC')
depends=('python')
makedepends=('python-setuptools' 'python-dephell')
conflicts=('python-pyxdg')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f4afbbc21a8405da1a7f4ad8f1d8abd3132aca2ef9c3441b39200d939041160f')

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
