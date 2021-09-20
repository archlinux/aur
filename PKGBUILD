# Maintainer: Kevin Franz Stehle <kevin dot franz dot stehle at cern dot ch>
pkgname=lpadmincern
pkgver=1.3.25
pkgrel=1
pkgdesc="CERN LDAP printer database client. Note: CERN IT does not provide official support for Arch Linux. Use at your own risk."
url="https://linuxsoft.cern.ch/cern/centos/7/cern/x86_64/repoview/lpadmincern.html"
arch=('any')
license=('GPL')
depends=('cups' 'perl' 'perl-ldap' 'python')
optdepends=()
makedepends=('gzip' 'tar')
conflicts=()
replaces=()
backup=()
source=("https://linuxsoft.cern.ch/cern/centos/7/cern/x86_64/Packages/lpadmincern-${pkgver}-${pkgrel}.el7.cern.noarch.rpm")
md5sums=('946aa1878b68752ee114c5221d434d17')

package() {
  msg2 "Creating directories"
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/etc/cron.daily/
  mkdir -p "${pkgdir}"/etc/logrotate.d/
  mkdir -p "${pkgdir}"/etc/sysconfig/
  mkdir -p "${pkgdir}"/usr/share/"${pkgname}"/ppds/
  mkdir -p "${pkgdir}"/usr/share/man/man1
  mkdir -p "${pkgdir}"/usr/share/man/man8
  mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"-"${pkgver}"

  msg2 "Installing scripts"
  install -m755 usr/sbin/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -m644 usr/share/"${pkgname}"/ppds/* "${pkgdir}"/usr/share/"${pkgname}"/ppds/
  
  install -m755 usr/bin/lpq.cern "${pkgdir}"/usr/bin/lpq.cern
  install -m755 usr/bin/lprm.cern "${pkgdir}"/usr/bin/lprm.cern
  install -m755 etc/cron.daily/lpadmincern "${pkgdir}"/etc/cron.daily/lpadmincern
  install -m644 etc/logrotate.d/lpadmincern "${pkgdir}"/etc/logrotate.d/lpadmincern
  install -m644 etc/sysconfig/lpadmincern "${pkgdir}"/etc/sysconfig/lpadmincern
 
  msg2 "Creating symlinks"
  pushd "${pkgdir}"/usr/bin > /dev/null
  ln -sf cancel.cups cancel.cern
  ln -sf lp.cups lp.cern
  ln -sf lpr.cups lpr.cern
  ln -sf lpstat.cups lpstat.cern
  cd "${pkgdir}"/usr/bin
  ln -sf lpc.cups lpc.cern
  popd > /dev/null
 
  msg2 "Installing manpages"  
  install -m644 usr/share/man/man1/"${pkgname}".1.gz "${pkgdir}"/usr/share/man/man1/"${pkgname}".1.gz
  install -m644 usr/share/man/man1/cancel-cern.1.gz "${pkgdir}"/usr/share/man/man1/cancel-cern.1.gz
  install -m644 usr/share/man/man1/lp-cern.1.gz "${pkgdir}"/usr/share/man/man1/lp-cern.1.gz
  install -m644 usr/share/man/man1/lpq-cern.1.gz "${pkgdir}"/usr/share/man/man1/lpq-cern.1.gz
  install -m644 usr/share/man/man1/lpr-cern.1.gz "${pkgdir}"/usr/share/man/man1/lpr-cern.1.gz
  install -m644 usr/share/man/man1/lprm-cern.1.gz "${pkgdir}"/usr/share/man/man1/lprm-cern.1.gz
  install -m644 usr/share/man/man1/lpstat-cern.1.gz "${pkgdir}"/usr/share/man/man1/lpstat-cern.1.gz
  install -m644 usr/share/man/man8/lpc-cern.8.gz "${pkgdir}"/usr/share/man/man8/lpc-cern.8.gz
  
  msg2 "Installing docs"
  install -m644 usr/share/doc/"${pkgname}"-"${pkgver}"/README "${pkgdir}"/usr/share/doc/"${pkgname}"-"${pkgver}"/README 
}
