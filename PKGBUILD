# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_name=black-macchiato
pkgname="python-${_name}"
pkgver=1.3.0
pkgrel=5
pkgdesc="Small utility built on top of the black Python code formatter to enable formatting of partial files"
arch=('any')
url="https://github.com/wbolster/black-macchiato"
license=('BSD-3-Clause')
depends=('python-black' 'python-importlib-metadata' 'python-setuptools' 'python>=3.6')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wbolster/black-macchiato/archive/refs/tags/${pkgver}.tar.gz"
	"0001-fix-empty-multi-line-string-test.patch::https://github.com/wbolster/black-macchiato/commit/d3243a1c95b5029b3ffa12417f0c587a2ba79bcd.patch")
b2sums=('a05b40f4c5a0c3118f5ed9237a4233b3bb5b87779b27141cb7a77921fe66f469a64d3edd4531540a1c68a0bd7642308b01553d21f953c917a47a7790a5d7684e'
        '9b10d245cd5ec926c1c710ad24646e6ae16acd031017d63569ca760aa6157b404796b5a7e218ea63637f05427366ce00dbaf46e3b7f3e37fbc7c932cb310febe')

prepare() {
    cd $_name-$pkgver
    patch --forward --strip=1 --input=../0001-fix-empty-multi-line-string-test.patch
}

build() {
    cd $_name-$pkgver
    python setup.py build
}

check() {
    cd $_name-$pkgver
    pytest
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
}
