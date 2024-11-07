# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=python-sectools
_pkgname=${pkgname#python-}
pkgver=1.4.4
pkgrel=1
pkgdesc='Offensive security python toolbox.'
arch=('any')
url='https://pypi.org/project/sectools/'
license=('GPL-3.0-only')
depends=('python' 'python-ldap3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('81af60152f8eefd55bcd8b779747f3f364f35dd24aaf8ffa060ac99f068a776cb5f2a7a1ce0c0a9bd02d5dcb4810dff274dd302661cd9c5a6f491ea50b0c053f')

# https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

