# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=papermerge-core
pkgver=3.5.3
pkgrel=1
pkgdesc="Open Source Document Management System for Digital Archives (server)"
arch=(any)
url="https://github.com/papermerge/papermerge-core"
license=(Apache)
depends=(
         img2pdf
         python-aiofiles
         python-alembic
         python-asyncpg
         python-celery
         python-fastapi
         python-magic
         python-mysqlclient
         python-passlib
         python-pdf2image
         python-pydantic-settings
         python-pytz
         python-redis
         python-rich
         python-salinic
         python-sqlalchemy
         python-taskipy
         python-typer
         python-uritemplate
         python-yaml
         uvicorn
)
makedepends=(python-build python-installer python-wheel python-poetry-core python-setuptools)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz
        0001_adj-pyproject.patch)
sha256sums=('ede9a07abe492bc7437d6a1320fe4954753f06d3af6100abe1ad3675ad5acfc2'
            '7e7bf9a48749f2b90209ec5d3bb8ee9784bc889b415e2ebb69878ce8dd0b2234')


prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np2 -i "${srcdir}"/0001_adj-pyproject.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
