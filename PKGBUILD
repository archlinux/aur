# Maintainer: Agam Singh <agam@agamsingh.me>
pkgname=globalplatformpro
pkgver=25.10.20
pkgrel=2
pkgdesc="Manage applets and keys on JavaCard-s like a pro"
arch=('any')
url="https://github.com/martinpaljak/GlobalPlatformPro"
license=('LGPL3')
depends=('java-runtime-headless' 'pcsclite')
makedepends=('git')
source=("https://github.com/martinpaljak/GlobalPlatformPro/releases/download/v${pkgver}/gp.jar")
sha256sums=('c88e0c5093032ec4571571f5397b6174e56bf632667950fa5bb716338534b122'
)
noextract=('gp.jar')

package() {
  # Install gp.jar (reproducibly built)
  install -d "$pkgdir"/usr/share/java/globalplatformpro/
  install -m 644 gp.jar "$pkgdir"/usr/share/java/globalplatformpro/

  # Install the launcher wrapper
  install -d "$pkgdir"/usr/bin/
  printf '#!/bin/sh\n' > gpp
  printf "exec /usr/bin/java -jar '/usr/share/java/globalplatformpro/gp.jar' \"\$@\"" >> gpp
  install -m 755 gpp "$pkgdir"/usr/bin/gpp
}
