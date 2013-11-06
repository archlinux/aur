# Maintainer: Sergey Mamonov <mrqwer88@gmail.com>
pkgname=maldet
pkgver=1.4.1
pkgrel=2
pkgdesc="Linux Malware Detect"
url="http://www.rfxn.com"
arch=('x86_64' 'i686')
license=('GPLv2')
 
source=("http://www.rfxn.com/downloads/maldetect-1.4.1.tar.gz")
md5sums=('1cbd253191365dc267eda5ab6d6af049')
 
package() {
  cd "${srcdir}/${pkgname}ect-${pkgver}"
  mkdir -p ../../pkg/usr/local/sbin
  mkdir -p ../../pkg/usr/lib
  mkdir -p ../../pkg/etc/cron.daily
  sed -i 's|/usr/|../../pkg/usr/|g' install.sh
  sed -i 's|/etc/|../../pkg/etc/|g' install.sh
  sed -i 's|$inspath/maldet --update|#$inspath/maldet --update|' install.sh
  sed -i 's|ln -fs $inspath/maldet|#ln -fs $inspath/maldet|' install.sh
  sh install.sh
  cd "../../pkg/usr/local/sbin/"
  ln -fs ../maldetect/maldet maldet
  ln -fs ../maldetect/maldet lmd
}
