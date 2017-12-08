# Maintainer: Amish <contact at via dot aur>
# Contributor: Isaac C. Aronson <i@pingas.org>

_user=shirkdog
pkgname=pulledpork
pkgver=0.7.3
pkgrel=1
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
sha256sums=('48c66dc9abb7545186d4fba497263c1d1b247c0ea7f0953db4d515e7898461a2'
            '361f698adbabdb85eaa559e26ae9feaca0ef1f419e76fe301364d9b67358475c'
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
