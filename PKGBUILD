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
            'f3b4203f84a19d4a37b9bc12a394c8c6be6ccb55f68b6aa0cf47482aeb7a335e'
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

