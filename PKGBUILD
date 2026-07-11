pkgname=earth-game
pkgver=0.1.3
pkgrel=1
pkgdesc='Private local-first quest and reflection companion with CLI and web UI'
arch=('any')
url='https://github.com/skorotkiewicz/earth-game'
license=('MIT')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9416194d64e69af77a8e97a554032200c0e95633af22d02ce626c2932a03f33b')

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
