# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-ufonormalizer'
_pkgname='ufonormalizer'
pkgver='0.5.4'
pkgrel=1
pkgdesc="A tool that will normalize XML and other data inside of a UFO"
url="https://github.com/unified-font-object/ufoNormalizer"
checkdepends=()
depends=()
makedepends=('python-setuptools')
optdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('eb8accf564c9c1f09e89d2d21b407bf2e58d26a3859651e35707db71cb218886')

prepare() {
    cd "$_pkgname-$pkgver"
    rm -rf src/ufonormalizer.egg-info
    sed -i '/setup_requires/d' setup.{py,cfg}
}

check() {
    cd "$_pkgname-$pkgver"
    python setup.py test
}

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
