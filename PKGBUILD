# Maintainer: Lubosz Sarnecki <lubosz at gmail com>

pkgname=python-django-haystack-git
pkgver=v3.2.1+4+g8ca77121
pkgrel=1
epoch=1
pkgdesc="Modular search for Django. Git version."
arch=(any)
url="https://github.com/django-haystack/django-haystack"
license=(BSD)
depends=(python-django)
optdepends=(
  'python-elasticsearch: interface with an elasticsearch instance as search backend'
  'python-pysolr: interface with a solr instance as search backend'
  'python-whoosh: use whoosh as search backend'
  'python-xapian-haystack: use python-xapian as search backend'
)
makedepends=(git python-build python-installer python-setuptools-scm python-wheel)
provides=("python-django-haystack=$pkgver")
conflicts=(python-django-haystack)
source=("git+https://github.com/django-haystack/django-haystack.git")
md5sums=("SKIP")

pkgver() {
  cd django-haystack
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd django-haystack
  python -m build --wheel --no-isolation
}

package() {
  cd django-haystack
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,CONTRIBUTING.md,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
