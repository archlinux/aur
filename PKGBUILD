# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-caringcaribou
_name=${pkgname#python-}
pkgver=0.6
pkgrel=1
epoch=
pkgdesc="A friendly car security exploration tool for the CAN bus."
arch=('any')
url="https://github.com/CaringCaribou/caringcaribou"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    python-can
    python-setuptools
    # AUR
    python-doipclient
    python-udsoncan
)
makedepends=(
    python-build
    python-installer
    python-wheel
    #     python-setuptools
)
options=('!strip' '!debug')
# source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('c41243c3cf72d5d289df9843f2b940898a852568e47220e6e445e6258f7aee22')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -dm 644 "$pkgdir/usr/share/doc/$pkgname/"
    cp -r documentation/*.md "$pkgdir/usr/share/doc/$pkgname/"
}
