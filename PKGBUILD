# Maintainer: Gunnar Bretthauer <taijian@posteo.de>

pkgname=dynamic-dns-netcup-api
pkgver=6.1
pkgrel=1
pkgdesc="A simple dynamic DNS client written in PHP for use with the netcup DNS API."
arch=('any')
license=('MIT')
url="https://github.com/stecklars/${pkgname}"
depends=('php-interpreter')
makedepends=('git')
optdepends=()
backup=(etc/${pkgname}/config.php)
_commit=392e6b16247cda85a9838b961e255c249688848c
source=("git+https://github.com/stecklars/${pkgname}.git#commit=$_commit"
        ${pkgname}.service
        ${pkgname}.timer)
sha256sums=('cda1c9ac7f321abda4f370dbd41d99b45ff1f8f7c8904b9b63261f30b1614216'
            'f8d030218d7ac033ba9ebc72ae6e5f25e5671e7ca69cb3c07bbb060a2426819a'
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

