# Maintainer: Magillos <kerown at  gmail dot com>
# Contributor: Magillos <kerown at  gmail dot com>

pkgname=llamification-git
_pkgname=llamification
pkgver=8dca5b1
pkgrel=1
pkgdesc="Lightweight Ollama-compatible proxy for online LLM providers (git)"
arch=('any')
url="https://github.com/magillos/LLamification"
license=('MIT')
depends=('python-pyqt6' 'python-aiohttp')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+https://github.com/magillos/LLamification.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags --always 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || echo "${pkgver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"

  
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 com.github.magillos.llamification.desktop \
    "${pkgdir}/usr/share/applications/com.github.magillos.llamification.desktop"

  install -Dm644 llamification/gui/LLamification.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.github.magillos.llamification.svg"
}
