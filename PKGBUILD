# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-rest-knox
pkgname=python-django-rest-knox
pkgver=4.2.0
pkgrel=1
pkgdesc="Authentication Module for django rest auth"
arch=('any')
url="https://github.com/James1345/django-rest-knox"
license=('MIT')
depends=('python-cryptography' 'python-django' 'python-django-rest-framework')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/James1345/django-rest-knox/archive/$pkgver.tar.gz")
sha512sums=('ff7252e35ed3998d882ba5f857ba7278340065ab849475b0b3d46a04842eac43f38f089fc138ebbe1495a06c4fd4ddb7bd1025a816ae4ad2c646752e74f85336')

build() {
  cd "$_pkgname-$pkgver" || exit
  python setup.py build
}

# check() {
#     https://wiki.archlinux.org/index.php/Python_package_guidelines#Check
#     > Avoid using tox to run testsuites
# }

package() {
  cd "$_pkgname-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --root="$pkgdir"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
