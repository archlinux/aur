# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=home-assistant-hacs
pkgdesc='Customize Home Assistant by downloading different integrations and themes'
pkgver=1.28.4
pkgrel=1
arch=(any)
url='https://hacs.xyz/'
license=(AGPL)
depends=(
  python-aiofiles
)
makedepends=(
  unzip
)
_tag=1.28.4
noextract=(
  'hacs.zip'
)
source=(
  "hacs.zip::https://github.com/hacs/integration/releases/download/${_tag}/hacs.zip"
)
sha256sums=('0cfc5e07ab5c24373ff098504592802ba5979005f7f428f7bc99bef863adf9ff')

prepare() {
  cd "$srcdir"

  unzip -o hacs.zip -d "$pkgname-$pkgver"
}

_hapath="/var/lib/private/hass/"
package() {
  cd "$pkgname-$pkgver"

  install -dm700 "$pkgdir/var/lib/private"
  install -dm755 "$pkgdir/$_hapath/custom_components"
  cp -dr --preserve=mode,timestamp . "$pkgdir/$_hapath/custom_components/hacs"
}

# vim: ts=2 sw=2 ft=PKGBUILD et:
