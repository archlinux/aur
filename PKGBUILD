# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=python-cronsim
_pkgname=${pkgname#python-}
_pkgver=2.6
pkgver=2.6.0
pkgrel=2
pkgdesc="A python cron expression parser and evaluator."
arch=('any')
url="https://github.com/cuu508/cronsim"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$_pkgver.tar.gz")
sha256sums=('5aab98716ef90ab5ac6be294b2c3965dbf76dc869f048846a0af74ebb506c10d')

build() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
