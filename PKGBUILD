# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=braindrop
pkgver=1.1.1
pkgrel=1
pkgdesc="Terminal client for raindrop.io"
arch=('any')
url="https://github.com/davep/braindrop"
license=('GPL-3.0-or-later')
depends=('python' 'python-httpx' 'python-humanize' 'python-pyperclip' 'python-pytz' 'python-textual' 'python-textual-enhanced' 'python-typing_extensions' 'python-xdg-base-dirs')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
source=("https://files.pythonhosted.org/packages/source/b/braindrop/braindrop-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/davep/braindrop/v${pkgver}/LICENSE")
sha256sums=('b1361ba851330a757365e659158c911d620847389f5b44b4756f55a0abc5ce13'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

build() {
  cd "braindrop-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "braindrop-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
