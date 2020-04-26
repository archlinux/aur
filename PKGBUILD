# Maintainer: Mubashshir <ahmubashshir@gmail.com>

_name=options
pkgname=( python-$_name python2-$_name )
pkgbase=python-$_name

pkgver=1.4.10
pkgrel=2
pkgdesc='Simple, super-flexible options. Does magic upon request.'

arch=(any)
url=https://bitbucket.org/jeunice/options
license=(Apache)
depends=()
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=(8bfdf4f11613181880fdb8bfc7fce3717c961d495b42ab605baf1b7c94e821aa)
makedepends=(python-setuptools python2-setuptools)
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
package_python-options()
{
    depends=( python )
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
package_python2-options()
{
    depends=( python2 )
    cd "$srcdir/$_name-$pkgver-py2"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
