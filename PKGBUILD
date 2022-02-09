# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-frequency-boost-switch
_pkgname=gnome-frequency-boost-switch
pkgver=2
pkgrel=1
pkgdesc="Add a toggle to enable/disable CPU frequency boost in Gnome Power Profiles menu."
arch=('any')
url="https://gitlab.com/metal03326/gnome-frequency-boost-switch"
license=('GPL3')
depends=('gnome-shell>=1.41')
makedepends=('zip')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz)
b2sums=('91b4e870c59877d1c66ea217de7bfe3337ca97360b74f0a15a779a10fd3d825ec97b75d08d42ecf559402123b60f2232eb49756ffa6a06199a12af78b736adf2')

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
