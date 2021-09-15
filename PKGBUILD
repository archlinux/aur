# $Id$
# Maintainer: AK <crt@archlinux.email>
pkgname=pwhois_milter
pkgver=1.5.1
pkgrel=1
pkgdesc="Postfix add-on which annotates an email message with information about the remote SMTP client IP address (City, Country, ISP)."
arch=('any')
url="https://pwhois.org/milter.who/"
options=(emptydirs)
license=("GPL")
depends=('libmilter')
optdepends=('postfix: the recommended MTA for use with pwhois_milter' 
            'exim: an alternative MTA')
install=${pkgname}.install
source=("https://pwhois.org/dl/index.who?file=${pkgname}_${pkgver}.tgz"
        "${pkgname}.service")
sha256sums=('f8bbcb047efe24617963f8f3ea9e061164c2a099fbe3b479313e83b9702bcb73'
            'c198a55ee30bc6b305d12563f75651f863b0756c1afe3ec2ec932c1504a60571')
build() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  install -D -m 0755 pwhois_milter "${pkgdir}"/usr/local/bin/pwhois_milter
  install -Dm0644 "${srcdir}/${pkgname}".service "${pkgdir}"/usr/lib/systemd/system/"${pkgname}".service
  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
}
