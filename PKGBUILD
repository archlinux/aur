# Maintainer: Michael Clayfield <me@michaelclayfield.com>

pkgname=icingaweb2-module-incubator
pkgver=0.17.0
pkgrel=1
pkgdesc="Bleeding edge libraries useful for Icinga Web 2 modules"
license=('GPL')
arch=('any')
depends=('icingaweb2')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz"
  "querybasedtable.patch")
sha256sums=('6aaac91f45c409c87d9a1c8e5d377afecc3669315a105b4f2a52b79b7dbcaa8e'
            '97985fbea5448293ff7cf64c0721a8a4522d84331a4a9bdb2a39dcafd1cd4583')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=2 --input="${srcdir}/querybasedtable.patch"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/etc/icingaweb2/modules/incubator"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/incubator"

  cp -r vendor composer.json composer.lock module.info run.php \
    "$pkgdir/usr/share/webapps/icingaweb2/modules/incubator"
}
