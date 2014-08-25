# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>

_pkgname=PyHamcrest
pkgbase=${_pkgname,,}
pkgname=(python{2,}-hamcrest)
pkgver=1.8.0
pkgrel=1
pkgdesc='A framework for writing matcher objects, allowing you to declaratively define "match" rules'
arch=('any')
url="https://github.com/hamcrest/PyHamcrest"
license=('BSD')
makedepends=(python{2,}-setuptools)
source=("https://pypi.python.org/packages/source/P/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('2a999f6909060cb6b81b894b57be7a91')
sha256sums=('0ffdff8385e2b5efb00e50478e5f41aeecb3b55e934b16817c2536704bbd2a2f')

_package() {
    pybin=$1
    depends=(${pybin})
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ${pybin} setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

for _name in "${pkgname[@]}"; do
    _splitname=(${_name//-/ }) # For retriving the python version needed
    eval "package_${_name}() { _package ${_splitname[0]}; }"
done
