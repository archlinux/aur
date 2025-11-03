# Maintainer: Quentin Delage <qdelage[at]ikmail.com>

pkgname="python-chromaterm"
_remotename="ChromaTerm"
pkgver=0.10.7
pkgrel=1
pkgdesc="Color your Terminal with RegEx!"
arch=("any")
url="https://github.com/hSaria/${_remotename}"
license=("MIT")
depends=(python python-psutil python-pyaml)
makedepends=(python-setuptools python-build python-installer)
source=("$_remotename-$pkgver.tar.gz::https://github.com/hSaria/${_remotename}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("73c2d359127a07af29ceaf2a7f4f21b9568d99ca462c24925022fd0680b15d13")

build() {
  cd "${_remotename}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_remotename}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
