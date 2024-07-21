# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-rest-knox
pkgname=python-django-rest-knox
pkgver=5.0.1
pkgrel=2
pkgdesc="Authentication Module for django rest auth"
arch=('any')
url="https://github.com/James1345/django-rest-knox"
license=('MIT')
depends=('python-cryptography' 'python-django' 'python-django-rest-framework')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/James1345/django-rest-knox/archive/$pkgver.tar.gz")
sha512sums=('a51d9abf61e64fd4eb63d1b696cecc11d1d0541a4b38edcaa72113b3fafe1c3c3da7c4ca0f7fa7ef464dfe57becb1483c8f8c3bb1ba710c5cfaed33ac14aace5')

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
