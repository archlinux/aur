# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Clayton Craft <clayton@craftyguy.net>

pkgname=python-geohash
_name=Geohash
pkgver=1.0
pkgrel=5
pkgdesc="Fast, accurate python geohashing library"
arch=("any")
url="https://github.com/vinsci/geohash"
license=("AGPL-3.0-or-later")
depends=("python"
         "python-docutils")
makedepends=("python-build"
             "python-installer"
             "python-setuptools"
             "python-wheel")
install="$pkgname.install"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "0001-fix-python-3.5.patch")
sha256sums=('2dd849ebaa0bc7ee565444df4fc57ae33daa89afa24b43617556560a04b71900'
            '0acc9bd46bd11f808b97d0f6a07644204d8127ca146ea2ed8b3578d71142c39b')

prepare(){
 cd "$_name-$pkgver"
 # https://github.com/vinsci/geohash/issues/4
 patch -p1 < "$srcdir/0001-fix-python-3.5.patch"
}

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
