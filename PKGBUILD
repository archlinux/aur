# Maintainer: Matt Harrison <matt@mistbyte.com>
# Contributor: Sergey Mamonov <mrqwer88@gmail.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/maldet

pkgname=maldet
pkgver=1.4.2
pkgrel=2
pkgdesc="Linux Malware Detect"
url="https://www.rfxn.com/projects/linux-malware-detect/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('lib32-glibc' 'perl')

source=("http://www.rfxn.com/downloads/maldetect-1.4.2.tar.gz")
sha256sums=('dd2badb95f75ae90ed94892d799aedadc79498a72ef3502ab87f35509c76c094')

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