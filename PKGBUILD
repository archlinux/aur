# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: pypi
# what: nulltype

_name=nulltype
pkgname=( python-$_name python2-$_name )
pkgbase=python-$_name

pkgver=2.3.1
pkgrel=5
pkgdesc='Null values and sentinels like (but not) None, False & True'

arch=(any)
url=https://web.archive.org/web/*/https://bitbucket.org/jeunice/nulltype
license=(Apache)
depends=()


makedepends=(python-setuptools python2-setuptools)
source=("$pkgbase-$pkgver.zip::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip")
sha256sums=('64aa3cb2ab5e904d1b37175b9b922bea268c13f9ce32e3d373313150ab5ef272')

prepare() {
    # copy folder, so we can cleanly build for both python versions
    cp -rup $_name-$pkgver $_name-$pkgver-py2
}
build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
    cd "$srcdir/$_name-$pkgver-py2"
    python2 setup.py build
}
package_python-nulltype()
{
    depends=( python )
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
package_python2-nulltype()
{
    depends=( python2 )
    cd "$srcdir/$_name-$pkgver-py2"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
