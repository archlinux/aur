# Maintainer: Yacob Zitouni <yacob.zitouni@gmail.com>

pkgname=python-jproperties
_name=jproperties
pkgver=2.1.1
pkgrel=1
pkgdesc="Java Property file parser and writer for Python"
url="https://github.com/Tblue/python-jproperties"
depends=('python3' 'python-six')
makedepends=('python-setuptools' 'python-setuptools-scm' "python-pytest")
license=('BSD' 'Python')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "setuptools_scm-version.patch")
sha256sums=('40b71124e8d257e8954899a91cd2d5c0f72e0f67f1b72048a5ba264567604f29'
            '901c1b8861c700dcdbf8f462ab21e8039061f87216c0b73872c8e4e2982f4f48')

prepare() {
    cd $srcdir
    patch  --forward --strip=1 --input="$srcdir/setuptools_scm-version.patch"  # Fix issue https://github.com/Tblue/python-jproperties/issues/15
}

build() {
    cd $srcdir/$_name-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_name-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1 
}
