# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Christoph Stahl <christoph.stahl@uni-dortmund.de>
# Contributor: Serge Victor <arch@random.re>

_pipname=Flask-APScheduler
_pkgname=flask-apscheduler
pkgbase=python-$_pkgname
pkgname=("python-$_pkgname" "python2-$_pkgname")
pkgver=1.11.0
pkgrel=1
pkgdesc='Adds APScheduler support to Flask'
arch=('any')
url="https://github.com/viniciuschiele/$_pkgname"
license=('Apache')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools' 'python-apscheduler' 'python2-apscheduler' 'python-dateutil' 'python2-dateutil' 'python-flask' 'python2-flask')
source=("$url/releases/download/$pkgver/$_pipname-$pkgver.tar.gz"
        '0001-Don-t-install-LICENSE-file.patch')
sha256sums=('7911d66e449f412d92a1a6c524217f44f4c40a5c92148c60d5189c6c402f87d0'
            '353a85fdcc9d8eee32fb7990155974eb30c8c79fe851a2fa6de700aaf59d8fb7')

prepare() {
  cd "$_pipname-$pkgver"
  for p in "$srcdir"/*.patch; do
    patch -Np1 -i "$p"
  done
  cd ..

  cp -a $_pipname-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_pipname-$pkgver"
  python setup.py build

  cd "$srcdir/$_pipname-$pkgver-py2"
  python2 setup.py build
}

package_python-flask-apscheduler() {
  depends=('python' 'python-apscheduler' 'python-dateutil' 'python-flask')

  cd "$_pipname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-flask-apscheduler() {
  depends=('python2' 'python2-apscheduler' 'python2-dateutil' 'python2-flask')

  cd "$_pipname-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
