# Maintainer: Michael Clayfield <me@michaelclayfield.com>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2-module-director
pkgver=1.11.5
pkgrel=1
pkgdesc="Manage Icinga 2 configuration from Icinga Web 2"
license=('GPL')
arch=('any')
depends=('icingaweb2' 'icingaweb2-module-incubator')
url="https://github.com/Icinga/icingaweb2-module-director"
install="icingaweb2-module-director.install"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz"
  "$pkgname.sysusers")
sha256sums=('e9eb6deb51b572382a20be92cf13d43d89299b431d262cfc985bc4aa01c8e769'
            '311043f4f4da68e5fcf8ad8593475d8287fe2f681e52940b33d41bc681d74cec')

prepare() {
  cd "$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm770 "$pkgdir/etc/icingaweb2/modules/director"
  chmod 2770 "$pkgdir/etc/icingaweb2"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/director"

  cp -r application contrib doc library public schema test \
    configuration.php module.info run.php run-missingdeps.php register-hooks.php \
    "$pkgdir/usr/share/webapps/icingaweb2/modules/director"

  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "contrib/systemd/icinga-director.service" "$pkgdir/usr/lib/systemd/system/icinga-director.service"
}

