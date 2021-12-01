# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: pypi
# what: ummalqura

_name=ummalqura
pkgname=( python-$_name python2-$_name )
pkgbase=python-$_name

pkgver=2.0
pkgrel=1
pkgdesc='Python Hijri Ummalqura'

arch=(any)
url=https://github.com/borni-dhifi/ummalqura
license=(unknown)
depends=()
source=("$pkgbase-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bd09af4166e7af5bfd8db90a51db4602a2e0b08e8d56edb46f3b5c010743d4ee')
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
package_python-ummalqura()
{
    depends=( python )
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
package_python2-ummalqura()
{
    depends=( python2 )
    cd "$srcdir/$_name-$pkgver-py2"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
