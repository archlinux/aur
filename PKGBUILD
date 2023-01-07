# Maintainer: Gunnar Bretthauer <taijian@posteo.de>

pkgname=dynamic-dns-netcup-api
pkgver=4.0
pkgrel=2
pkgdesc="A simple dynamic DNS client written in PHP for use with the netcup DNS API."
arch=('any')
license=('MIT')
url="https://github.com/stecklars/${pkgname}"
depends=('php')
makedepends=()
optdepends=()
backup=(etc/${pkgname}/config.php)
source=("https://github.com/stecklars/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        ${pkgname}.service
        ${pkgname}.timer)
sha256sums=('2c6d94e6b3fe863878dda9071aadf4cae4153367639c0e48f85b632e765c356a'
            '359db333e91a49c9a9413dc52f524ef47c2192186cb7edfbf5277cd54bb5cb7d'
            '2b5d495fcb9c30171ec5244bd2182681ff931a7a8ccef317eb0d7a93ae34d99a')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  
  # install the php scripts
  install -Dm755 ./update.php "${pkgdir}/usr/share/${pkgname}/update.php"
  install -Dm644 ./functions.php "${pkgdir}/usr/share/${pkgname}/functions.php"
 
  # install systemd files
  install -Dm644 $srcdir/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 $srcdir/${pkgname}.timer "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
  
  # copy the readmes
  install -Dm644 ./README.md "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
  install -Dm644 ./config.dist.php "${pkgdir}/usr/share/doc/${pkgname}/config.php.example"
  
  # copy example config to /etc/${pkgname}
  install -Dm640 ./config.dist.php "${pkgdir}/etc/${pkgname}/config.php"
}

