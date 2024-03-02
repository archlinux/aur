# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-modelcluster
pkgname=python-django-modelcluster
pkgver=6.3
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
sha512sums=('0edb03dc04aa9e6e3e6d17e7bda5a64c0cdeecdd31c6e7207330d22a7720ab4c955eb07ac4f50fa5063feaf57328d3d8eedb365a3eef37d5c7524466c680500c')

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
