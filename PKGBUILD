# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: willemw <willemw12@gmail.com>

pkgname=castero
pkgver=0.8.1
pkgrel=1
pkgdesc='TUI podcast client for the terminal'
arch=('x86_64')
url='https://github.com/xgi/castero'
license=('MIT')
depends=('python-beautifulsoup4' 'python-cjkwrap' 'python-grequests' 'python-lxml' 'python-mpv')
makedepends=('python-setuptools')
optdepends=('python-vlc: vlc playback')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7be704002399bd39e6188f8a478d0717d1a6c7fd48e29c0ff4aa3117ca9f8dc3')

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
