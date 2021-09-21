# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: pypi
# what: combomethod

_name=combomethod
pkgname=( python-$_name python2-$_name)
pkgbase=python-$_name
pkgver=1.0.12
pkgrel=7
pkgdesc='Decorator indicating a method is both a class and an instance method'

arch=(any)
url=https://web.archive.org/web/*/https://bitbucket.org/jeunice/combomethod
license=(Apache)
depends=()

makedepends=(python-setuptools python2-setuptools)
source=("$pkgbase-$pkgver.zip::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip")
sha256sums=('4975b436ffe3e0a2561b58e3e9d047a50f4b16c8d4956d6a3e6ce566d034dd5e')

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

package_python-combomethod()
{
    depends=( python )
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-combomethod()
{
    depends=( python2 )
    cd "$srcdir/$_name-$pkgver-py2"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
