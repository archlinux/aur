# Maintainer: Malte Jürgens <maltejur@dismail.de>
# Contributor: Matthias Fulz < mfulz at olznet dot de >

pkgname=betaflight-configurator-nightlies-bin
_pkgname=betaflight-configurator
pkgver=v20230801.504
pkgrel=1
pkgdesc="Nightly builds of the Betaflight Configurator "
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator-nightlies"
source=("https://github.com/betaflight/betaflight-configurator-nightlies/releases/download/v20230801.504/betaflight-configurator_10.10.0-debug-507bf8f_linux64-portable.zip")
sha256sums=("b5fbf82a96b6df896b9169a9997b6c3bd36d3502bd0ad75a8d20f7aa6df3305e")
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
