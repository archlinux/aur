# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: pypi
# what: urlmatch

_name=urlmatch
pkgname=( python-$_name python2-$_name)
pkgbase=python-$_name
pkgver=1.0.1
pkgrel=1
pkgdesc='fnmatch for the web'

arch=(any)
url=https://github.com/jessepollak/urlmatch
license=(Apache)
depends=()

makedepends=(python-setuptools python2-setuptools)
source=("$pkgbase-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3f0c3529f03f3b31efc4547ce44e6512ff5714bf61f7f6ac355b1636ad16eb2d')

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

package_python-urlmatch()
{
    depends=( python )
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-urlmatch()
{
    depends=( python2 )
    cd "$srcdir/$_name-$pkgver-py2"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
