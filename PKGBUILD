# Maintainer: Mansour Behabadi <mansour@oxplot.com>

pkgname=airstatus-git
pkgver=20220109.db9de00
pkgrel=1
pkgdesc="Check AirPods battery levels on Linux"
arch=('i686' 'x86_64')
url="https://github.com/delphiki/AirStatus"
license=('GPL')
depends=('python' 'python-bleak')
makedepends=('git')
provides=('airstatus')
conflicts=('airstatus')
source=("git+https://github.com/delphiki/AirStatus.git"
        "airstatus.service")
sha256sums=('SKIP'
            'dc74cf84be34ba277b1e684eff8a9726600e6cc1dc9b06ffce811de01afbf8b3')

pkgver() {
  cd AirStatus
  printf "%s.%s" "$(git show -s --format=%cs | tr -d -)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 airstatus.service -t "${pkgdir}/usr/lib/systemd/system"

  cd AirStatus
  install -Dm644 main.py "${pkgdir}/usr/lib/airstatus.py"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/airstatus"
}
