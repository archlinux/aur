# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-metatube
_name=${pkgname#python-}
pkgver=1.0.6
pkgrel=1

pkgdesc="Downloads YouTube metadata"
url="https://gitlab.com/christoph.fink/metatube"
license=("GPLv3")

arch=("any")
makedepends=("python-setuptools")
depends=(
    "python-dateparser"
    "python-sqlalchemy"
    "python-pyaml"
    "python-requests"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("7555acc2e02ba5fe0844de2d6bb8d7c686940fccb922afd628dc308f7197b386")

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
    mv "${pkgdir}/usr/metatube.yml.example" "${pkgdir}/usr/share/${pkgname}/examples/"
}
