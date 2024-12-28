# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-modelcluster
pkgname=python-django-modelcluster
pkgver=6.4
pkgrel=1
pkgdesc="Django extension to allow working with 'clusters' of models as a single unit, independently of the database."
arch=('any')
url="https://github.com/wagtail/django-modelcluster"
license=('BSD')
depends=('python')
optdepends=('python-django-taggit')
makedepends=('python-setuptools')
checkdepends=('python-django' 'python-django-taggit')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/wagtail/django-modelcluster/archive/v$pkgver.tar.gz")
sha512sums=('fc2ef73be95eea3d7e6f3451b471e5d2d044ab7f50a64ba2b40ec5d81e36f76ccc579bc4845cc60ba88ad38cefb25213a6317378b2d560104f5975108c11f8ad')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  python runtests.py
}

package() {
  cd "$_pkgname-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --root="$pkgdir"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
