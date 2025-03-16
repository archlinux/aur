# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=papermerge-core
pkgver=3.4.1
pkgrel=1
pkgdesc="Open Source Document Management System for Digital Archives (server)"
arch=(any)
url="https://github.com/papermerge/papermerge-core"
license=(Apache)
depends=(img2pdf
         python-celery
         python-configula
         python-django-filter
         python-django-celery-results
         python-django-dynamic-preferences
         python-django-modelcluster
         python-django-rest-knox
         python-django-taggit
         python-dj-config-url
         python-dj-database-url
         python-fastapi
         python-httpx
         python-jose
         python-lxml
         python-magic
         python-mysqlclient
         python-ocrmypdf-papermerge
         python-passlib
         python-pdf2image
         python-persisting-theory
         python-psycopg2
         python-python-multipart
         python-redis
         python-salinic
         python-uritemplate
         python-websockets
         python-xapian
         python-yaml
         uvicorn
         uwsgi-plugin-python)
makedepends=(python-build python-installer python-wheel python-poetry-core python-setuptools)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz
        0001_fix-pyproject.patch)
sha256sums=('2dad3b8434784031efcdb88b2846ef41aae09a7679e5b42af22c60f5d16e375f'
            'f1c63043d0e1308fe35a8e952727812eedcdab6eb5fbb4e82b78cc7f7669c983')


prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np2 -i "${srcdir}"/0001_fix-pyproject.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
