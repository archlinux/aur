# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-frequency-boost-switch
_pkgname=gnome-frequency-boost-switch
pkgver=6
pkgrel=1
pkgdesc="Add a toggle to enable/disable CPU frequency boost in Gnome Power Profiles menu."
arch=('any')
url="https://gitlab.com/metal03326/gnome-frequency-boost-switch"
license=('GPL3')
depends=('gnome-shell>=1.41')
makedepends=('zip')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz)
b2sums=('d76f046b4f1f42d7615fa7a30bc484b68aa4596f67e0ed2aad8ba9b80ef354bb2ebf1403c57cebd5659da6518bc098188c1ca90bc053c529f413b37c40b233bc')

build() {
  cd "$_pkgname-v$pkgver"

  make build
}

package() {
  cd "$_pkgname-v$pkgver"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' src/metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
