# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-sphinx-quark-theme
_srcname=quark-sphinx-theme
pkgver=0.6.0
pkgrel=2
pkgdesc='A Sphinx theme designed for QTextBrowser'
arch=('any')
url="https://gitlab.com/fkrull/${_srcname}"
license=('BSD-2-Clause')
depends=('python-sphinx')
makedepends=('python-flit' 'python-pip')
source=("https://gitlab.com/fkrull/${_srcname}/-/archive/v${pkgver}/${_srcname}-v${pkgver}.tar.gz")
sha256sums=('d2ef2adaba57ab9eeada195486d5ac7e9c21a84c948437b5842f9ad91135fdec')

build() {
    cd ${_srcname}-v${pkgver}
    flit build --format wheel
}

package() {
    cd ${_srcname}-v${pkgver}
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
    install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
