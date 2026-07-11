pkgname=earth-game
pkgver=0.1.1
pkgrel=1
pkgdesc='Private local-first quest and reflection companion with CLI and web UI'
arch=('any')
url='https://github.com/skorotkiewicz/earth-game'
license=('MIT')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('002051be46f6e1a0bc335e9cfd7a0841e9a705cc276bbfbbcaa54b82b8d6453a')

check() {
  cd "${pkgname}-${pkgver}"
  python -m py_compile earth earth_core.py earth_web.py
  python -m unittest -v
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
