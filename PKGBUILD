# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-rest-knox
pkgname=python-django-rest-knox
pkgver=4.2.0
pkgrel=2
pkgdesc="Authentication Module for django rest auth"
arch=('any')
url="https://github.com/James1345/django-rest-knox"
license=('MIT')
depends=('python-cryptography' 'python-django' 'python-django-rest-framework')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/James1345/django-rest-knox/archive/$pkgver.tar.gz")
sha512sums=('7f0008691d13101401b6c5c9bbd892bae33219dd1d2b06f1744a9962b9a4133af9aab527a45df46b8547b45125dbc2c792db05ae16a631053c815439fbf53b35')

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
