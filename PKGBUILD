# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

pkgname="python-gogs-client"
pkgver=1.0.6
pkgrel=3
pkgdesc="Python client for Gogs server"
arch=("any")
url="https://github.com/unfoldingWord-dev/python-gogs-client"
license=("MIT")
depends=("python-future" "python-requests")
makedepends=("python-setuptools")
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/unfoldingWord-dev/python-gogs-client/archive/v${pkgver}.tar.gz")
sha512sums=("3ecdb78017ad7ceb769d548cd94383c20ddc59ba3d14cf78cf3bbf451d64177af1233593782e787499d7267ca0d4ab5ceefee5a0ccdd248843b3a631ec282855")

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir}
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # see unfoldingWord-dev/python-gogs-client#18 in upstream
  # also see SpotlightKid comment on 2019-03-10 20:21
  # https://aur.archlinux.org/packages/python-gogs-client/  
  local pyver=$(python -c 'import sys; print("{0}.{1}".format(*sys.version_info))')
  rm -f "${pkgdir}/usr/lib/python${pyver}/site-packages/tests/__init__.py"
}

# vim:set ts=2 sw=2 et:
