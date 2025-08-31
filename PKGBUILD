# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-cn2an
_name=${pkgname#python-}
pkgver=0.5.23
pkgrel=1
epoch=
pkgdesc="Convert Chinese numerals and Arabic numerals."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    # AUR
    python-proces
    python-torbjorn
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('eda06a63e5eff4a64488d9f22e5f2a4ceca6eaa63416e4f771e67edecb1a5bdb')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
