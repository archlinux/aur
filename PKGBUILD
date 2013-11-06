# Maintainer: Sergey Mamonov <mrqwer88@gmail.com>
pkgname=maldet
pkgver=1.4.1
pkgrel=3
pkgdesc="Linux Malware Detect"
url="http://www.rfxn.com"
arch=('x86_64' 'i686')
license=('GPLv2')

source=("http://www.rfxn.com/downloads/maldetect-1.4.1.tar.gz")
md5sums=('1cbd253191365dc267eda5ab6d6af049')

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