# Author: Martin Minka <martin dot minka at gmail dot com>
pkgname=xtbackup
pkgver=0.8.2
asdkver=1.6.3
pkgrel=1
pkgdesc="PHP backup script/library with special drivers for MySQL, Amazon RDS and Amazon S3."
arch=('any')
url="http://k2s.github.io/xtbackup/"
license=('custom:UNLICENSE' 'Apache')
depends=('php' 'php-sqlite')
source=("https://github.com/k2s/xtbackup/archive/v${pkgver}.tar.gz" "https://github.com/amazonwebservices/aws-sdk-for-php/archive/${asdkver}.tar.gz")
md5sums=('916e579eefa6a04db6bd9de85359fdbb'
         '6c6b4d4b3d181f8ef29ee7772836d9e1')
build() {
  cd "$srcdir/xtbackup-${pkgver}"
  cp -r "$srcdir/aws-sdk-for-php-${asdkver}/"* "$srcdir/xtbackup-${pkgver}/lib/AWSSDKforPHP/"
  rm -f xtbackup.iml
  rm -f .gitignore
  rm -f .gitmodules
  #rm -f lib/AWSSDKforPHP/.gitignore
}
package() {
  install -D -m644 "$srcdir/xtbackup-${pkgver}/UNLICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
  install -d "$pkgdir/usr/share/xtbackup/"
  cp -r "$srcdir/xtbackup-${pkgver}/"* "$pkgdir/usr/share/xtbackup/"
  chmod +x "$pkgdir/usr/share/xtbackup/xtbackup.sh"  
  install -d "$pkgdir/usr/bin/"
  ln -s "/usr/share/xtbackup/xtbackup.sh" "$pkgdir/usr/bin/xtbackup" 
}
