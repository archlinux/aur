# Maintainer: Malte Jürgens <maltejur@dismail.de>
# Contributor: Matthias Fulz < mfulz at olznet dot de >

pkgname=betaflight-configurator-nightlies-bin
_pkgname=betaflight-configurator
pkgver=v20230803.508
pkgrel=1
pkgdesc="Nightly builds of the Betaflight Configurator "
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator-nightlies"
source=("https://github.com/betaflight/betaflight-configurator-nightlies/releases/download/v20230803.508/betaflight-configurator_10.10.0-debug-4204281_linux64-portable.zip")
sha256sums=("82976a79b3182c19737fd5b0e2497cf9211d3c11d37eea16b6cf7e6330c03f7d")
options=(!strip)
license=("GPL3")
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgname.install

package() {
  mkdir -p "$pkgdir/opt/betaflight"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Betaflight Configurator/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  cp -dpr --no-preserve=ownership "$srcdir/Betaflight Configurator" "$pkgdir/opt/betaflight/betaflight-configurator"
  ln -s "/opt/betaflight/betaflight-configurator/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  chmod +xr "$pkgdir/opt/betaflight/betaflight-configurator/chrome_crashpad_handler"
  chmod +xr "$pkgdir/opt/betaflight/betaflight-configurator/betaflight-configurator"
  chmod -R +Xr "$pkgdir/opt/betaflight/betaflight-configurator/"
}
