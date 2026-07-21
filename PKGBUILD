# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-exejs
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Run JavaScript code from Python."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(Apache-2.0)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=()
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('4fb81c58bbdeea01d210cae68bafadf4d620bbcfabe11a6aa6c47158c18cfd15')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    # cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
