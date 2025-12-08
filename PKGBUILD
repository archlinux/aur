# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-modelcluster
pkgname=python-django-modelcluster
pkgver=6.4.1
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
sha512sums=('6749f63d1917b3e558302e4fa23cda3dd6754e636c3f5a1095cea403deedfd3b06f7c903be2a1a46b28f94dab15c3b533c976cb49dbfc611f74958fea4cc8c76')

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
