# Maintainer: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2
pkgver=2.0.0_rc1
_pkgver=2.0.0-rc1
pkgrel=1
pkgdesc="Icinga Web 2 Interface"
license=('GPL')
arch=('any')
depends=('php')
optdepends=('php-gd: export data to PDF'
            'php-intl: support for internationalization'
            'php-ldap: for LDAP authentication'
            'php-pgsql: for PostgreSQL backend')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${_pkgver}.tar.gz")
install='icingaweb2.install'
sha256sums=('2d86bc919f5c37eec8145a3cedaeb60c2bdebab01d38650c2c18b7b43ea1c707')

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  #mkdir -p "$pkgdir/etc/webapps/icingaweb2"
  mkdir -p "$pkgdir/etc/icingaweb2"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2"
  mkdir -p "$pkgdir/var/log/icingaweb2"

  cp -r application doc library modules public bin "$pkgdir/usr/share/webapps/icingaweb2"
  ln -s /usr/share/webapps/icingaweb2/bin/icingacli "$pkgdir/usr/bin/icingacli"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/icingaweb2/LICENSE"
  install -Dm644 etc/bash_completion.d/icingacli "$pkgdir/etc/bash_completion.d/icingacli"
  cp -r etc/schema "$pkgdir/usr/share/icingaweb2"

  #chmod 2770 "$pkgdir/etc/webapps/icingaweb2"
  chmod 2770 "$pkgdir/etc/icingaweb2"
  chmod 750 "$pkgdir/var/log/icingaweb2"
}
