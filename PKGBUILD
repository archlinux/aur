# Maintainer: A Farzat <a@farzat.xyz>

_pkgname=pip-cache
pkgname="$_pkgname"
pkgver=0.0.6
pkgrel=1
pkgdesc="Local PyPi Package Name Cache."
url="https://github.com/brunobeltran/pip-cache"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "LICENSE")
md5sums=('19cd75d7d391ea6358287ca357d2b525'
         '927926b2325dd718ba00afa0e52c11f9')

prepare() {
    # The license file was obtained from a fork as the original missed one.
    # https://github.com/jayvdb/pip-cache/blob/sdist/LICENSE.
    cp LICENSE "$_pkgname-$pkgver"
    cd "$_pkgname-$pkgver"
    # Prevent package from installing files into user's home directory.
    sed -i '/data_files/{N;N;d;}' setup.py
}

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
