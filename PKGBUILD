# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
_name=pytest-env
pkgname=('python-pytest-env' 'python2-pytest-env')
pkgbase=python-$_name
pkgver=0.6.2
pkgrel=1
pkgdesc="py.test plugin that allows you to add environment variables."
arch=(any)
url="https://github.com/MobileDynasty/pytest-env"
license=('MIT')
makedepends=(python-pytest python2-pytest)  # setuptools included
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/MobileDynasty/pytest-env/master/LICENSE')
sha256sums=('7e94956aef7f2764f3c147d216ce066bf6c42948bb9e293169b1b1c880a580c2'
            '62b9b932cf5effd097de675f6604f05dc1fa57553ad5e25381563c0cd9a922b4')

prepare() {
  cp -a $_name-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build

  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py build
}

package_python-pytest-env() {
  depends=(python-pytest)
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pytest-env() {
  depends=(python2-pytest)
  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
