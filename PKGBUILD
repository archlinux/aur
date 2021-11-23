# Maintainer: ftsell <aur@finn-thorben.me>
pkgname=python-bgpdumpy
_name=${pkgname#python-}
pkgdesc="A libbgpdump Python CFFI wrapper for analyzing MRTv1 and MRTv2 BGP table dump files"
pkgver=1.1.4
pkgrel=1
arch=("x86_64")
url="https://github.com/AlexForster/bgpdumpy"
license=("custom:BSD-3-Clause")

makedepends=("ca-certificates" "gcc" "make" "autoconf" "python-setuptools" "python" "python-cffi" "libffi")
depends=("bzip2" "zlib")
source=("bgpdumpy-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1e936b41b679275ace2ebce650443d71261762310b1db03af18825f81b9da7a5')

build() {
    # create build directory
    cd "${srcdir}/bgpdumpy-${pkgver}"
    python  setup.py clean
    rm -rf build dist
    python setup.py build
}

package() {
    cd "${srcdir}/bgpdumpy-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

