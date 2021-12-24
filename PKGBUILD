# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgbase=python2-taskw
pkgname=(python-taskw python2-taskw)
pkgver=1.3.1
pkgrel=1
pkgdesc="Python bindings for your taskwarrior database"
url="http://github.com/ralphbean/taskw"
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')
license=("GPL")
arch=('any')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/ralphbean/taskw/archive/${pkgver}.tar.gz")
sha256sums=('811218b490a69560f8673b3d1946b45d3ad43abff4ebd4aa9409569bb6b41dd1')

prepare() {
  cp -a taskw-$pkgver{,-py2}
}

build(){
  cd "$srcdir/taskw-$pkgver"
  python setup.py build

  cd "$srcdir/taskw-$pkgver-py2"
  python2 setup.py build
}

package_python2-taskw(){
    depends=("python2" "python2-six" "python2-pytz"
             "python2-dateutil" "python2-kitchen")

    cd "$srcdir/taskw-$pkgver-py2"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python-taskw(){
    depends=("python" "python-six" "python-pytz"
             "python-dateutil" "python-kitchen")

    cd "$srcdir/taskw-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
