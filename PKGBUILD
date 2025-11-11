# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=python-comtypes
_pkgname=comtypes
pkgver=1.4.13
pkgrel=1
pkgdesc='Lightweight pure Python COM package based on the ctypes foreign function interface library; allows you to define, call, and implement custom and dispatch-based COM interfaces.'
arch=('any')
url='https://github.com/enthought/comtypes'
license=('any-OSI')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('1305dd3b5208e7f1db70446545d2a1c097ea485df548ff7e499dd3995ae127cba33ca354c68fc1bbecf424ed4925847f32a8e3e6902eb0e1db0efaf38271fa16')

# https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

