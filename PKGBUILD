# Maintainer: Andrew Steinke <rkcf@rkcf.me>
# Contributor: mdraw.gh at gmail dot com

pkgbase=python-better-exceptions
_pkgbase='better-exceptions'
pkgname=(python-better-exceptions python2-better-exceptions)
pkgver=0.2.2
pkgrel=3
pkgdesc="Pretty and useful exceptions in Python, automatically"
arch=('any')
url='https://github.com/Qix-/better-exceptions'
license=('MIT')
depends=('python' 'python2')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('40e33eb6a58c219e3425ea7c6a8f4811')

prepare() {
  cp -rup "$_pkgbase-$pkgver" "${_pkgbase}2-$pkgver"
}

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py build

  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py build
}

package_python-better-exceptions() {
  depends=('python')
  conflicts=('python-better-exceptions-git')

  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-better-exceptions() {
  depends=('python2')
  conflicts=('python2-better-exceptions-git')

  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
