# Maintainer: Sarah Wilson <sarah at swilson dot id dot au>
pkgname=rockbox_listenbrainz_scrobbler
pkgver=1.3.1
pkgrel=1
pkgdesc="A utility to send a rockbox .scrobble.log to ListenBrainz"
arch=('any')
url="https://github.com/AnotherStranger/rockbox-scrobbler"
license=(MIT)
depends=('python' 'python-typing_extensions' 'python-requests' 'python-typer' 'pyside6' 'python-pydantic')
makedepends=('python-poetry' 'python-build' 'python-installer')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9923a57549fc8fb4dd7f3135dc7d1878a1b22ce4d6b4be3ece165a9eef42ef2e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
