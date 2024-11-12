# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=python-oncalendar
_pkgname=${pkgname#python-}
_pkgver=1.1
pkgver=1.1.0
pkgrel=1
pkgdesc="A python systemd OnCalendar expression parser and evaluator."
arch=('any')
url="https://github.com/cuu508/oncalendar"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$_pkgver.tar.gz")
sha256sums=('3122aa811786c313568a53745015729aa650e35054b689c08b6db4b1ee891287')

build() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
