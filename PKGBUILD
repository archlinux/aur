# Maintainer: Julian Brost <julian@0x4a42.net>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2
pkgver=2.14.1
pkgrel=1
pkgdesc="Icinga Web 2 Interface"
license=('GPL-3.0-only')
arch=('any')
depends=('php-interpreter' 'icinga-php-library>=1.0.0' 'icinga-php-thirdparty>=1.0.0')
optdepends=('php-legacy-gd: export data to PDF'
            'php-legacy-imagick: graphs in PDF exports'
            'php-legacy-intl: support for internationalization'
            'php-legacy-pgsql: for PostgreSQL backend')
url="https://icinga.com/"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Icinga/icingaweb2/archive/v$pkgver.tar.gz")
install='icingaweb2.install'
sha256sums=('3cb7f3db206d0545d6b9f8064218d94b86bb6dc4b41a87b032521e39e4edf1b3')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #mkdir -p "$pkgdir/etc/webapps/icingaweb2"
  mkdir -p "$pkgdir/etc/icingaweb2"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2"
  mkdir -p "$pkgdir/var/log/icingaweb2"

  cp -r application bin doc library modules public schema "$pkgdir/usr/share/webapps/icingaweb2"
  ln -s /usr/share/webapps/icingaweb2/bin/icingacli "$pkgdir/usr/bin/icingacli"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/icingaweb2/LICENSE.md"
  install -Dm644 etc/bash_completion.d/icingacli "$pkgdir/etc/bash_completion.d/icingacli"

  #chmod 2770 "$pkgdir/etc/webapps/icingaweb2"
  chmod 2770 "$pkgdir/etc/icingaweb2"
  chmod 2770 "$pkgdir/var/log/icingaweb2"
}
