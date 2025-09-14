# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='wayback-machine-archiver'
pkgver=3.3.1
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
sha256sums=('a8347cc9ba306e7be1f92283e8801a1db9427aeb2ec7b51f8a0e9728e9cf8e65')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

