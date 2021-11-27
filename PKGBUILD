# Maintainer: GI Jack <GI_Jack@hackermail.com>
# Original: hexptr <hexptr@protonmail.com>

pkgname=streamdeck-ui
pkgver=1.1.2
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
sha512sums=('26c431f4c9a552d9dc79af9387b465d50a41de09d169a2d7642aef4c21e34cd6097981437c7b7a9f24b574fafa385cd4469f0a6a25a1de32b3b5a113f6a3f581'
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

