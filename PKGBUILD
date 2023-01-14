# Maintainer: Grant G <grant@fig.io>

pkgname='fig-nightly-bin'
pkgver='2.13.0_nightly.20230113'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
makedepends=('jq')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/nightly/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('e962e8dfcd1aaf702e9521b5bd232b9d836b6c5ddab012c84afa7f506a1085a9')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  manifest="${pkgdir}/usr/share/fig/manifest.json"
  echo "$( jq '.managed_by = "pacman"' $manifest )" > $manifest
}
