# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=python-textual-jumper
pkgver=0.2.1
pkgrel=1
pkgdesc="Keyboard-driven navigation widget for Textual applications"
arch=('any')
url="https://github.com/zaloog/textual-jumper"
license=('MIT')
depends=('python' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
source=("https://files.pythonhosted.org/packages/source/t/textual_jumper/textual_jumper-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zaloog/textual-jumper/v${pkgver}/LICENSE")
sha256sums=('1f9a5d76b0ce42fd8308dd381567bf17f7c07707d72d48b9e4cec53b30facc7d'
            '65488488ef180ea39fc38f5cab8120d0617dbb2ceae068ee031c509e2388bffb')

build() {
  cd "textual_jumper-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "textual_jumper-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
