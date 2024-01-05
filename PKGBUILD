# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-modelcluster
pkgname=python-django-modelcluster
pkgver=6.2.1
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
sha512sums=('76a9affa95b79e57ea2bb8db41b6eff84bb6b42c31679fc73d287e8b814c4a4003b0f66a648998d2ddbd26d2006d2e5883bb09dbaa82d1fb203f80a80b285d03')

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
