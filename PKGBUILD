# Maintainer: Amish <contact at via dot aur>
# Contributor: Isaac C. Aronson <i@pingas.org>

_user=shirkdog
pkgname=pulledpork
pkgver=0.7.2
pkgrel=4
pkgdesc="Tool to automatically update rules for snort"
arch=('any')
url="https://github.com/${_user}/${pkgname}"
license=('GPL')
depends=('cron' 'perl' 'perl-lwp-protocol-https' 'perl-crypt-ssleay' 'perl-archive-tar' 'perl-switch' 'perl-bytes-random-secure')
optdepends=('snort')
backup=('etc/pulledpork/pulledpork.conf'
        'etc/pulledpork/disablesid.conf'
        'etc/pulledpork/dropsid.conf'
        'etc/pulledpork/enablesid.conf'
        'etc/pulledpork/modifysid.conf')
source=("pulledpork-${pkgver}.tar.gz::https://github.com/${_user}/${pkgname}/archive/${pkgver}.tar.gz"
        "pulledpork.conf"
        "pulledpork_update.sh"
        "pulledpork.cron")
sha256sums=('50046477d5d1a18aec131a56bd3f21170057d8a31fd6f30af706e31d5b14bd0a'
            '60ae10e636568a216e5629a1e73450d086fd77cd3328f5ba2c90d2483a1e9c08'
            '584326ce79c1694849f60f25e4306ae3f2df6228c34c2e6f3ba30993f53e6a3f'
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
