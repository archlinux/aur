# Maintainer: vlensys (contact me on github for wtv reason)
pkgname=lyricspot
pkgver=1.1.4
pkgrel=1
pkgdesc="Live synced lyrics in your terminal, pulled from Spotify"
arch=('any')
url="https://github.com/vlensys/lyricspot"
license=('MIT')
depends=('python' 'python-pipx')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vlensys/lyricspot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f912d6c2e7fd6e2916345165f28eaebaa87b8f7c474e8afe8169e573f3765235')

package() {
  cd "${pkgname}-${pkgver}"

  PIPX_HOME="$pkgdir/opt/pipx" \
    PIPX_BIN_DIR="$pkgdir/usr/bin" \
    pipx install . --python python3

  find "$pkgdir" -type f \( -name "*.py" -o -name "pyvenv.cfg" -o -name "lyricspot" \) \
    -exec sed -i "s|$pkgdir||g" {} \; 2>/dev/null || true
}
