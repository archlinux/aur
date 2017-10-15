# Maintainer: IanDury

pkgname=dashticz-git
pkgver=2.r3127
pkgrel=2
pkgdesc="Alternative dashboard for Domoticz"
arch=('x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/robgeerts/dashticz_v2/tree/master"
#license=('GPL') ?
depends=('domoticz-latest')
install='dashticz.install'
makepends=('coreutils')
source=("git+https://github.com/robgeerts/dashticz_v2.git"
        'dashticz.install')
sha256sums=('SKIP'
            'a87b3c6299d9e33fc985d76c2ba6034f15a3cc5221b0379d758c00fffe0a16d4')
_gitname="dashticz_v2"

pkgver() {
  cd $_gitname
  echo -e "$pkgver\c" | sed -e 's/\..*//'
  echo ".r"$(git log | wc -l)
}

package() {
  mkdir -p  "${pkgdir}/opt/domoticz/www/dashboard"
  cp -r $_gitname/* "${pkgdir}/opt/domoticz/www/dashboard/"
  chown -R http:http "${pkgdir}/opt/domoticz/www"
}
