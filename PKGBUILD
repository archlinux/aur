# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-frequency-boost-switch
_pkgname=gnome-frequency-boost-switch
pkgver=3
pkgrel=1
pkgdesc="Add a toggle to enable/disable CPU frequency boost in Gnome Power Profiles menu."
arch=('any')
url="https://gitlab.com/metal03326/gnome-frequency-boost-switch"
license=('GPL3')
depends=('gnome-shell>=1.41')
makedepends=('zip')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz)
b2sums=('05988892039b3935f00bc128019f0f1980c0eaa2ac0d0762ce69b0779fadd04f8a3c6f2ebe7413a4ff05ff891915f8c5619469354f7d44565a13ce336b8ced91')

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
