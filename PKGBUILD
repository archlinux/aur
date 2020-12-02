# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-polymorphic-tree
pkgname=python-django-polymorphic-tree
pkgver=1.5.1
pkgrel=1
pkgdesc="Polymorphic MPTT tree support for models"
arch=('any')
url="https://github.com/django-polymorphic/django-polymorphic-tree"
license=('Apache')
depends=('python-django' 'python-django-mptt' 'python-django-polymorphic' 'python-django-tag-parser' 'python-future')
makedepends=('python-setuptools' 'python-django-js-asset-git')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/django-polymorphic/django-polymorphic-tree/archive/v$pkgver.tar.gz")
sha512sums=('291ed73400c3a5073cbfe00fdd0dab16ac7dbb4fa96fc1797f526ef7235111162806c4be3fddb0bc6cd61560bdb6d1ac806c2f83380a1d45735d876c4f79ac67')

build() {
  cd "$_pkgname-$pkgver" || exit
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver" || exit
  python runtests.py
}

package() {
  cd "$_pkgname-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --root="$pkgdir"
}
