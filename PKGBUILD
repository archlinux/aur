# Maintainer: Tobias Frisch <thejackimonster@gmail.com>
pkgbase=python-sphinx-multiversion
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.2.4
pkgrel=1
pkgdesc="Sphinx extension for building self-hosted versioned docs."
arch=('any')
url="https://holzhaus.github.io/sphinx-multiversion/"
license=('BSD')
depends=('python-sphinx')
makedepends=('python-installer')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/py3/${_pyname:0:1}/${_pyname}/${_pyname//-/_}-${pkgver}-py3-none-any.whl")
md5sums=('875491323d0b6130a242e0cc12b9d4c4')

check() {
    nosetests || warning "Tests failed"
}

package() {
    depends=('python-sphinx')
    
	install -D -m644 ${_pyname//-/_}-${pkgver}.dist-info/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    python -m installer --destdir="${pkgdir}" ${srcdir}/${_pyname//-/_}-${pkgver}-py3-none-any.whl
}

