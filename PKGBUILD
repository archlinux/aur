# Maintainer: A Frederick Christensen <fauxmight@nosocomia.com>

pkgbase=python-backports.ssl
pkgname=(python-backports.ssl python2-backports.ssl)
_pkgname=backports.ssl
pkgver=0.0.9
pkgrel=1
pkgdesc="The Python 3.4 standard 'ssl' module API implemented on top of pyOpenSSL"
arch=('x86_64')
url="https://pypi.python.org/pypi/backports.ssl"
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=(https://pypi.python.org/packages/source/b/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('c25ac7a4d288aeb9a8554ad91aafae25')

prepare() {
  cp -a "$_pkgname-$pkgver"{,-py2}

  # Conflicts with python2-backports, otherwise
  rm $_pkgname-$pkgver-py2/backports/__init__.py
}

build() {
  cd "$srcdir"/"$_pkgname-$pkgver"
  python3 setup.py build

  cd "$srcdir"/"$_pkgname-$pkgver"-py2
  python2 setup.py build
}

package_python-backports.ssl() {
  depends=('python')

  cd $_pkgname-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
}

package_python2-backports.ssl() {
  depends=('python2' 'python2-backports')

  cd $_pkgname-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
