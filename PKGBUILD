# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-wolkenbruch
_name="${pkgname#python-}"
pkgdesc="Remind you to pack your rain gear when it’s forecast to rain"
url="https://gitlab.com/christophfink/wolkenbruch/"

pkgver=0.6.3
pkgrel=2

arch=("x86_64" "i686")
license=("BSD")

makedepends=(
    "python-setuptools"
)
depends=(
    "python"
    "python-geocoder"
    "python-pyaml"
    "python-requests"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("83a56fc39a9cedd73c2831afa458ec693ec248e934a45db63027d9c3d4479b86")

prepare() {
    rm -Rf "${srcdir}/*/*.egg-info"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -c "from setuptools import setup; setup();" build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1

    install \
        -Ddm755 \
        "${pkgdir}/usr/share/${pkgname}/examples"
    mv "${pkgdir}/usr/wolkenbruch.yml.example" "${pkgdir}/usr/share/${pkgname}/examples/"

}
