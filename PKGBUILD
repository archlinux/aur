# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='wayback-machine-archiver'
pkgver=4.0.0
pkgrel=1
pkgdesc='Submit web pages to the Wayback Machine for archiving'
arch=('any')
url='https://github.com/agude/wayback-machine-archiver'
_url_pypi='https://pypi.org/project/wayback-machine-archiver'
license=('MIT')
depends=(
  'python-dotenv'
  'python-requests'
  'python-urllib3'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('28c442c10e422f8179493500e3a47b49280ceed6472d490a6fcd9dd6a66dc0fd')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

