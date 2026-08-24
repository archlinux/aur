# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-doipclient
_name=${pkgname#python-}
pkgver=1.2.2
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
sha256sums=('d591816ed38e66ecf348fd9fd99e1cc44fe57e14ed6fa3a1371c85996d98f4e9')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
