pkgname=space-dodge
pkgver=1.0.2
pkgrel=1
pkgdesc="Fast-paced space survival game built with Python and pygame"
arch=('any')
url="https://github.com/EvansOgala/Space-Dodge"
license=('MIT')
depends=('python' 'python-pygame')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/Space-Dodge"

  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/lib/SpaceDodge"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/metainfo"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

  install -Dm755 space-dodge "${pkgdir}/usr/bin/space-dodge"
  install -Dm644 games_final.py "${pkgdir}/usr/lib/SpaceDodge/games_final.py"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 org.evans.SpaceDodge.desktop "${pkgdir}/usr/share/applications/org.evans.SpaceDodge.desktop"
  install -Dm644 org.evans.SpaceDodge.appdata.xml "${pkgdir}/usr/share/metainfo/org.evans.SpaceDodge.appdata.xml"
  install -Dm644 org.evans.SpaceDodge.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.evans.SpaceDodge.svg"

  local asset
  for asset in ./*.jpg ./*.png ./*.mp3; do
    [ -e "${asset}" ] || continue
    install -Dm644 "${asset}" "${pkgdir}/usr/lib/SpaceDodge/${asset#./}"
  done
}
