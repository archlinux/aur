# Maintainer: Patrick Griffis <tingping@tingping.se>

pkgname=python-fastboot-log-parser
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=4
epoch=
pkgdesc="A parser for Fastboot logs"
arch=('any')
url="https://pypi.org/project/fastboot-log-parser/"
license=(MIT)
depends=(python)
makedepends=(python-setuptools-scm)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('c52cb51cc76f83b194754d8d08c25332d07a20e440cda55cff3c16b4fc59fc82')

prepare() {
    cd "${_name//-/_}-$pkgver"
    # simplejson is listed as a dependency but not used at all.
    # https://gitlab.com/mediatek/aiot/bsp/fastboot-log-parser/-/merge_requests/1
    sed -i "s/'simplejson',//" ./setup.py
}

build() {
    cd "${_name//-/_}-$pkgver"
    python setup.py build
}

package() {
    cd "${_name//-/_}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
