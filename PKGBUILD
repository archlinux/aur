# Maintainer: Zen <dev@pyl.onl>
pkgname=python-zenlib-git
pkgver=2.3.2.r0.g09e2cb0
pkgrel=1
pkgdesc="Useful python decorators and utilities"
arch=('x86_64')
url="https://github.com/desultory/zenlib"
license=('GPL2')
conflicts=('python-zenlib')
provides=('python-zenlib')
makedepends=(git python-build python-installer python-wheel python-setuptools)
source=("git+https://github.com/desultory/zenlib")
# https://wiki.gentoo.org/wiki/User:Zen_desu
# gpg  --keyserver 'hkps://keys.openpgp.org' --recv-keys 7751D62F9F9A0454B86871CE64FA651BB8850B48
#validpgpkeys=('7751D62F9F9A0454B86871CE64FA651BB8850B48')
sha256sums=(SKIP) 
_name=${pkgname#python-};
_name=${_name%-git}

pkgver() {
    cd $_name
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
}
