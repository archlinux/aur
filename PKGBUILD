# Current Maintainer: Sean Snell <ssnell@lakecs.net>
# Previous Maintainer: GI Jack <GI_Jack@hackermail.com>
# Original: hexptr <hexptr@protonmail.com>

pkgname=streamdeck-ui
pkgver=2.0.6
pkgrel=2
pkgdesc="A Linux compatible UI for the Elgato Stream Deck"
arch=('any')
url="https://timothycrosley.github.io/streamdeck-ui/"
license=('MIT')
depends=('python-pillow' 'python-hidapi' 'pyside2' 'python-pynput' 'python-elgato-streamdeck>=0.9.1' 'python-xlib' 'python-filetype' 'python-cairosvg')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
provides=('streamdeck-ui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/timothycrosley/streamdeck-ui/archive/refs/tags/v${pkgver}.tar.gz"
        "60-streamdeck.rules"
        "streamdeck-ui.desktop"
        "elgato.png")
# The first hash in the list is the tar.gz
# The second is 60-streamdeck.rules
# The third is streamdeck-ui.desktop
# The fourth is elgato.png

sha512sums=('1f4f2c30c037d33f2e2e035acaf2d393fb63bb455c9e3192a9393acaffb32ba4e6822a75255203d6e38048b3a5e901ba4555c2f8344f30d6c9f8cb80c296ac4a'
            '690aa38c549b09c7c49d99e47dea74fc47d778881ce1947d9da37f6d1d94f8745c4724c23a702167e6d714ea9b4fd13a4414eb6945b17728eef9b5319b9a6c0f'
            '5c7b8abeae9f5475ec6033ed39f11d4d460210bfe570b9b13ece46df8f2edb7e6039b190071ee20e2a0b74fba6ced8886d95213494a0f8f93d075b809cc540f9'
            '1145e8cdebdf950090d0833e40984cd402345d559c9faf8aab89f5ec4db5d5de685b68418faf39288f08e9a642fcf1cc53a719b1b11c8ebfac6dd8b42d4898d2')

build() {
  cd "${pkgname}-${pkgver}"
  DISABLE_CONAN=ON python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 "$srcdir/60-streamdeck.rules" "${pkgdir}/usr/lib/udev/rules.d/60-streamdeck.rules"
  install -Dm 644 "$srcdir/streamdeck-ui.desktop" "${pkgdir}/usr/share/applications/streamdeck-ui.desktop"
  install -Dm 644 "$srcdir/elgato.png" "${pkgdir}/usr/share/pixmaps/elgato.png"
}
