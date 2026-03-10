# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-rest-knox
pkgname=python-django-rest-knox
pkgver=5.0.4
pkgrel=1
pkgdesc="Authentication Module for django rest auth"
arch=('any')
url="https://github.com/James1345/django-rest-knox"
license=('MIT')
depends=('python-cryptography' 'python-django' 'python-django-rest-framework')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/James1345/django-rest-knox/archive/$pkgver.tar.gz")
sha512sums=('d384ad009814cf8e594957206131e093e6b31e1e806f69b99fd15e12b51195c8eef4ac28db3715a64c039ba0fd16fb2dbe267df06165eb89a2550e6e5bc67d24')

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
