pkgname=earth-game
pkgver=0.1.2
pkgrel=1
pkgdesc='Private local-first quest and reflection companion with CLI and web UI'
arch=('any')
url='https://github.com/skorotkiewicz/earth-game'
license=('MIT')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9a457216520f01bcf3fb440096f96d4bca57f30bc1cb0a758032040dca9f5d63')

check() {
  cd "${pkgname}-${pkgver}"
  python -m py_compile earth earth_core.py earth_web.py
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 earth "${pkgdir}/usr/lib/earth-game/earth"
  install -Dm644 earth_core.py earth_web.py -t "${pkgdir}/usr/lib/earth-game/"

  install -d "${pkgdir}/usr/bin"
  ln -s ../lib/earth-game/earth "${pkgdir}/usr/bin/earth"
  ln -s earth "${pkgdir}/usr/bin/earth-game"

  install -Dm644 README.md USAGE.md -t "${pkgdir}/usr/share/doc/earth-game/"
  install -Dm644 assets/earth-game-banner.png \
    "${pkgdir}/usr/share/doc/earth-game/assets/earth-game-banner.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
