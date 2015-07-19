# Maintainer: Amish <contact at via dot aur>
# Contributor: Isaac C. Aronson <i@pingas.org>

pkgname=pulledpork
pkgver=0.7.0
pkgrel=3
pkgdesc="Tool to automatically update rules for snort"
arch=('any')
url="https://code.google.com/p/pulledpork"
license=('GPL')
depends=('cron' 'perl' 'perl-lwp-protocol-https' 'perl-crypt-ssleay' 'perl-archive-tar' 'perl-switch')
optdepends=('snort')
backup=('etc/pulledpork/pulledpork.conf'
        'etc/pulledpork.conf'
        'etc/pulledpork/disablesid.conf'
        'etc/pulledpork/dropsid.conf'
        'etc/pulledpork/enablesid.conf'
        'etc/pulledpork/modifysid.conf')
source=("https://pulledpork.googlecode.com/files/pulledpork-${pkgver}.tar.gz"
        "pulledpork.conf"
        "pulledpork_update.sh"
        "pulledpork.cron")
sha256sums=('f60c005043850bb65a72582b9d6d68a7e7d51107f30f2b3fc67e607c995aa1a8'
            '3c788c1f0c50070bc5e3ccde59f9cf38d1007b5a89828228cd02d47f56fb6f9c'
            '7ec58f5e73b3432eadab9a6050f17d5a1bd038ef2cfe52023da9f772ac532f98'
            'c9213d3076424dc391d09a6c19f769631f668f27206585dd98dcbf9390a1b9ee')
install=install

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -dm755 "${pkgdir}"/etc/cron.weekly "${pkgdir}"/etc/pulledpork "${pkgdir}"/usr/bin
  install -Dm644 etc/* "${pkgdir}"/etc/pulledpork/
  install -Dm644 ../pulledpork.conf "${pkgdir}"/etc/pulledpork/
  install -Dm700 ../pulledpork.cron "${pkgdir}"/etc/cron.weekly/pulledpork
  install -Dm755 pulledpork.pl ../pulledpork_update.sh "${pkgdir}"/usr/bin/
}
