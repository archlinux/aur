# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-modelcluster
pkgname=python-django-modelcluster
pkgver=5.1
pkgrel=1
pkgdesc="Django extension to allow working with 'clusters' of models as a single unit, independently of the database."
arch=('any')
url="https://github.com/wagtail/django-modelcluster"
license=('BSD')
depends=('python-pytz')
optdepends=('python-django-taggit')
makedepends=('python-setuptools')
checkdepends=('python-django' 'python-django-taggit')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/wagtail/django-modelcluster/archive/v$pkgver.tar.gz")
sha512sums=('bb3d8640a04cabfdebe7f60b571a2b2c4d71bbf5d4ea0ff0e7db5fe9d120e6eab7ec3f1b6992d21aff377045f8ed3e11d1b351ce2f460b33dd4c0f3a8dd749fb')

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

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
