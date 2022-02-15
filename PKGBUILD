# Maintainer: GI Jack <GI_Jack@hackermail.com>
# Original: hexptr <hexptr@protonmail.com>

pkgname=streamdeck-ui
pkgver=1.1.3
pkgrel=2
pkgdesc="A Linux compatible UI for the Elgato Stream Deck"
arch=('any')
url="https://timothycrosley.github.io/streamdeck-ui/"
license=('MIT')
depends=('python-pillow' 'python-hidapi' 'pyside2' 'python-pynput' 'python-elgato-streamdeck')
makedepends=('git' 'python-dephell' 'python-setuptools')
provides=('streamdeck-ui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/timothycrosley/streamdeck-ui/archive/refs/tags/v${pkgver}.tar.gz"
        "60-streamdeck.rules")
sha512sums=('f0b5939c026dc076729774db7c4d898347228fc6b4f2887bd8142298ba64d9dc47d8bf680968b16cd5428af6647b26c1d10446e75fd68352f9451662e843cd53'
            '690aa38c549b09c7c49d99e47dea74fc47d778881ce1947d9da37f6d1d94f8745c4724c23a702167e6d714ea9b4fd13a4414eb6945b17728eef9b5319b9a6c0f')

prepare() {
  cd "${pkgname}-${pkgver}"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 "$srcdir/60-streamdeck.rules" "${pkgdir}/usr/lib/udev/rules.d/60-streamdeck.rules"
}

