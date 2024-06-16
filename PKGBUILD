# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=python-librivox
pkgver=0.1
pkgrel=1
pkgdesc='Python library for interfacing with LibriVox'
arch=('any')
url='https://codeberg.org/Freso/python-librivox'
license=('AGPL-3.0-or-later')
depends=('python')
makedepends=(
  'python-hatchling'
  'python-hatch-vcs'
  # Generic/Arch Linux
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('388a3e285b5dfcc4dc51afda4ae0869fbe7319357c2f0f41b0f4a99c48b1a3eccb8416400b04452005a8126b404e60fdcdfa90a0e5ee38d5f741e94fc528060c')

build() {
  cd "$srcdir/${pkgname%-git}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
