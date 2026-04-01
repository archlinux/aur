# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-cmake
_name=${pkgname#python-}
pkgver=4.3.1
pkgrel=1
epoch=
pkgdesc="CMake is an open-source, cross-platform family of tools designed to build, test and package software"
arch=($CARCH)
url="https://pypi.org/project/${_name}"
license=('Apache-2.0 AND BSD-3-Clause')
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    sh
    cmake
    gcc-libs
    glibc
    libidn2
    openssl
    ncurses
    python
)
makedepends=(
    python-scikit-build-core
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('6fe523413cdd2568a19a6ec297b8f869a95a3f8edaf0dd73731b81412216e00e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE_Apache_20 -t"${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 LICENSE_BSD_3 -t"${pkgdir}/usr/share/licenses/${pkgname}/"
    rm -rf ${pkgdir}/usr/bin
}
