# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-wolkenbruch
_name="${pkgname#python-}"
pkgdesc="Remind you to pack your rain gear when it’s forecast to rain"
url="https://gitlab.com/christophfink/wolkenbruch/"

pkgver=0.6.4
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
sha256sums=("7f87330e5409c1886dfb9215223b1a41c8fdf9deb186799a46b958ae7a797ea8")

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
