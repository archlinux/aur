# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: willemw <willemw12@gmail.com>

pkgname=castero
pkgver=0.8.0
pkgrel=1
pkgdesc="TUI podcast client for the terminal"
arch=('any')
url="https://github.com/xgi/castero"
license=('MIT')
depends=('python-beautifulsoup4' 'python-cjkwrap' 'python-grequests' 'python-lxml' 'python-mpv')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('31b302c436fd732d0af3767ed55c0f7e7698a463da86eba333053c6bd59f51d1')

prepare() {
  # Use mpv by default; Remove python-vlc dependency
  sed -i '/python-vlc/d' "${pkgname}-${pkgver}/setup.py"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'CHANGELOG.md' "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et: