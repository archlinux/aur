# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-dunamai"
_name=${pkgname#python-}
pkgdesc="Produce dynamic, standards-compliant version strings"
url="https://github.com/mtkennerly/dunamai"

pkgver=1.13.1
pkgrel=1

arch=("any")
license=("MIT")

makedepends=(
    poetry
    python-build
    python-installer
    python-wheel
)
depends=(
    "python"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("f543d4989656be2167ee5e36b203e21ef749e42e7ca12f6f91c7dcbbbaa5d55c57f8608ca9153a4db12bf0ef29bbb6ec2856c4611fe2893b6fd16f488abab664")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
