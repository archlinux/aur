# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-doipclient
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
epoch=
pkgdesc="A Diagnostic over IP (DoIP) client implementing ISO-13400-2."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    # AUR
    python-udsoncan
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('4251368f300f1422aaa7bc2c37fea8dbab63b4e33e47fb0122834cb6915d96f6')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
