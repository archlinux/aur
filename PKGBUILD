# Maintainer: Bruce Cutler <bruce@sumebrius.net>
_pkgname=django-ninja
# Upstream is inconsistent with package version tagging as "v" or "v.", which affects download url and tarred directory name
#_remote_prefix="v."
#_src_prefix="v."
_remote_prefix="v"
_src_prefix=""
pkgname=python-django-ninja
pkgver=1.2.2
pkgrel=1
pkgdesc="Fast Django REST Framework"
arch=('any')
url="https://django-ninja.rest-framework.com/"
license=('MIT')
depends=('python-django>=2.2'
         'python-pydantic>=2.0')
makedepends=('python-flit'
             'python-installer')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/vitalik/django-ninja/archive/refs/tags/$_remote_prefix$pkgver.tar.gz")
sha256sums=('27db4fa07b00d250071796cbf9f8ba7f75b1cd7cd9790dd3006fb6717aba0f3f')

build() {
  cd "$_pkgname-$_src_prefix$pkgver"

  flit build --format=wheel  
}

package() {
  cd "$_pkgname-$_src_prefix$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
