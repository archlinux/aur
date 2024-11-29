# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=python-comtypes
_pkgname=comtypes
pkgver=1.4.8
pkgrel=1
pkgdesc='Lightweight pure Python COM package based on the ctypes foreign function interface library; allows you to define, call, and implement custom and dispatch-based COM interfaces.'
arch=('any')
url='https://github.com/enthought/comtypes'
license=('any-OSI')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('b0d79b7f0eefce953db978325b507328d16c2666c46a8e3b0c58a522408f8c40c7f7583c66ac64a56cf0a0ede5fdb515e9b5b7cb72ae42cd2bc2c6ac7799b848')

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

