# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=python-sectools
_pkgname=${pkgname#python-}
pkgver=1.5.0
pkgrel=1
pkgdesc='Offensive security python toolbox.'
arch=('any')
url='https://pypi.org/project/sectools/'
license=('GPL-3.0-only')
depends=('python' 'python-ldap3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('b7cfafa1ab42fa23180454ac61c5e5e328036024ebaf01c1c3674ed243e0a862b576be2d0de045f5f46dc17fa087d733ec1c04f9d0e20ac0d508208adc27567f')

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

