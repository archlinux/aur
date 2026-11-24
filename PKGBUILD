# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=prismriver-lyrics
pkgver=1.1.0
pkgrel=1
pkgdesc="Search song lyrics across multiple sources, with a TUI that follows the playing track over MPRIS"
arch=('any')
url="https://github.com/anlar/prismriver-lyrics"
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-curl_cffi' 'python-dbus-next' 'python-httpx' 'python-mutagen' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1ad3b871a553ff6aea40fe94eaed4a097c8e116e46b0e858178b231cc9ec81ff')

build() {
  cd "${pkgname}-${pkgver}"
  for _pkg in core tui; do
    python -m build --wheel --no-isolation --outdir dist "packages/${_pkg}"
  done
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
