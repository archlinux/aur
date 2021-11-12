# Maintainer: Rudis Muiznieks <rudis@sitosis.com>

pkgname=vulscan-git
pkgver=r77.425ee70
pkgrel=1
pkgdesc='A module which enhances nmap to a vulnerability scanner'
url='https://www.computec.ch/projekte/vulscan/'
arch=('any')
license=('GPL')
depends=('nmap')
source=("${pkgname%-git}::git+https://github.com/scipag/vulscan.git")
md5sums=('SKIP')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "$pkgdir/usr/share/nmap/scripts/"
  GLOBIGNORE=".git" cp -a "$srcdir/${pkgname%-git}" "$pkgdir/usr/share/nmap/scripts/${pkgname%-git}"
}
