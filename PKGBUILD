# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgbase=python2-taskw
pkgname=(python-taskw python2-taskw)
pkgver=1.2.0
pkgrel=3
pkgdesc="Python bindings for your taskwarrior database"
url="http://github.com/ralphbean/taskw"
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')
license=("GPL")
arch=('any')
source=("${pkgbase}-${pkgname}.tar.gz::https://github.com/ralphbean/taskw/archive/${pkgver}.tar.gz")
sha256sums=('560c8290705f049ce33d75079adcc50e45cdb8b8373d1fd8384b24a215d84591')

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
