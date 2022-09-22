# Maintainer: Michael Clayfield <me@michaelclayfield.com>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2-module-director
pkgver=1.10.0
pkgrel=1
pkgdesc="Manage Icinga 2 configuration from Icinga Web 2"
license=('GPL')
arch=('any')
depends=('icingaweb2' 'icingaweb2-module-incubator')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz"
  "$pkgname.sysusers")
sha256sums=('99ad16a08004fd2c25be8c787b26e3a0032a83ca5119a785befcdd318c4d53b8'
            '311043f4f4da68e5fcf8ad8593475d8287fe2f681e52940b33d41bc681d74cec')

prepare() {
  cd "$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/etc/icingaweb2/modules/director"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/director"

  cp -r application contrib doc library public schema test \
    configuration.php module.info run.php run-missingdeps.php register-hooks.php \
    "$pkgdir/usr/share/webapps/icingaweb2/modules/director"

  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "contrib/systemd/icinga-director.service" "$pkgdir/usr/lib/systemd/system/icinga-director.service"
}

