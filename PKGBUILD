# Maintainer: Sergey Mamonov <mrqwer88@gmail.com>
pkgname=maldet
pkgver=1.4.2
pkgrel=1
pkgdesc="Linux Malware Detect"
url="http://www.rfxn.com"
arch=('x86_64' 'i686')
license=('GPLv2')

source=("http://www.rfxn.com/downloads/maldetect-1.4.2.tar.gz")
md5sums=('6dd1372668766fa4332f8376c4e627e1')

package() {
  cd "${srcdir}/${pkgname}ect-${pkgver}"
  mkdir -p ${pkgdir}/usr/local/sbin
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/etc/cron.daily
  sed -i "s|/usr/|${pkgdir}/usr/|g" install.sh
  sed -i "s|/etc/|${pkgdir}/etc/|g" install.sh
  sed -i 's|$inspath/maldet --update|#$inspath/maldet --update|' install.sh
  sed -i 's|ln -fs $inspath/maldet|#ln -fs $inspath/maldet|' install.sh
  sh install.sh
  cd "${pkgdir}/usr/local/sbin/"
  ln -fs ../maldetect/maldet maldet
  ln -fs ../maldetect/maldet lmd
}