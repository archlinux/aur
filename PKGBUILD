# Maintainer: Bruce Cutler <bruce@sumebrius.net>
_pkgname=django-ninja
# Upstream is inconsistent with package version tagging as "v" or "v.", which affects download url and tarred directory name
_remote_prefix="v."
_src_prefix="v."
#_remote_prefix="v"
#_src_prefix=""
pkgname=python-django-ninja
pkgver=0.21.0
pkgrel=2
pkgdesc="Fast Django REST Framework"
arch=('any')
url="https://django-ninja.rest-framework.com/"
license=('MIT')
depends=('python-django>=2.2'
         'python-pydantic>=1.6')
makedepends=('python-flit'
             'python-installer')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/vitalik/django-ninja/archive/refs/tags/$_remote_prefix$pkgver.tar.gz")
sha256sums=('6db363e8bc308eba89a1501b61a40082948001d7574e31fbba8d05a46292a19c')

build() {
  cd "$_pkgname-$_src_prefix$pkgver"

  flit build --format=wheel  
}

package() {
  cd "$_pkgname-$_src_prefix$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
