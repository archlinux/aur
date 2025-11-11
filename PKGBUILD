# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=python-sectools
_pkgname=${pkgname#python-}
pkgver=1.5.1
pkgrel=1
pkgdesc='Offensive security python toolbox.'
arch=('any')
url='https://pypi.org/project/sectools/'
license=('GPL-3.0-only')
depends=('python' 'python-ldap3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('50407b2e09303327eb9b1da8296f5fff560f3825eeaca19c6464092672903005ca46abc8704ace03e2a10f41f6d31e7e97fd4d346a7f0d3eca1afe24cf20eebf')

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

