# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_pkgname='wayback-machine-archiver'
pkgname="${_pkgname}-git"
pkgver=3.3.1.r0.gc8d6ecf
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
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
