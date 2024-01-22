# Maintainer: Gunnar Bretthauer <taijian@posteo.de>

pkgname=dynamic-dns-netcup-api
pkgver=4.0
pkgrel=4
pkgdesc="A simple dynamic DNS client written in PHP for use with the netcup DNS API."
arch=('any')
license=('MIT')
url="https://github.com/stecklars/${pkgname}"
depends=('php-interpreter')
makedepends=('git')
optdepends=()
backup=(etc/${pkgname}/config.php)
_commit=c065cb62a5966ec3b829835ac42f0b5d6fa107df
source=("git+https://github.com/stecklars/${pkgname}.git#commit=$_commit"
        ${pkgname}.service
        ${pkgname}.timer)
sha256sums=('SKIP'
            '359db333e91a49c9a9413dc52f524ef47c2192186cb7edfbf5277cd54bb5cb7d'
            'e47b47ba368cbaf09cb63fdbeaef632f6fd358e6994440d8d3a682ee4510e648')

package() {
  cd "$srcdir/${pkgname}"
  
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

