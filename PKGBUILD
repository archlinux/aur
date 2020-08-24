# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: willemw <willemw12@gmail.com>

pkgname=castero
pkgver=0.8.2
pkgrel=1
pkgdesc='TUI podcast client for the terminal'
arch=('x86_64')
url='https://github.com/xgi/castero'
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-cjkwrap' 'python-grequests' 'python-lxml' 'python-mpv')
makedepends=('python-setuptools')
optdepends=('python-vlc: vlc playback')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2dd0f33965e8d5908b3ad04660d810add538b579e9aa75c7237855a8193daf8e')

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
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
  install -Dm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
