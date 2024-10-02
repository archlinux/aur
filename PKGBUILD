# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-rest-knox
pkgname=python-django-rest-knox
pkgver=5.0.2
pkgrel=2
pkgdesc="Authentication Module for django rest auth"
arch=('any')
url="https://github.com/James1345/django-rest-knox"
license=('MIT')
depends=('python-cryptography' 'python-django' 'python-django-rest-framework')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/James1345/django-rest-knox/archive/$pkgver.tar.gz")
sha512sums=('4bc4020435152ee75d00df44e1b546fcf262c6a75d2d5172c9fbb31f29319d332ba5191b50b99bfc01280c8d76a84604e9b4e0fe5a438b98e9e466bd70f13c99')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

# check() {
#     https://wiki.archlinux.org/index.php/Python_package_guidelines#Check
#     > Avoid using tox to run testsuites
# }

package() {
  cd "$_pkgname-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --root="$pkgdir"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
