# Maintainer: Malte Jürgens <maltejur@dismail.de>
# Contributor: Matthias Fulz < mfulz at olznet dot de >

pkgname=betaflight-configurator-nightlies-bin
_pkgname=betaflight-configurator
pkgver=v20230512.453
pkgrel=1
pkgdesc="Nightly builds of the Betaflight Configurator "
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator-nightlies"
source=("https://github.com/betaflight/betaflight-configurator-nightlies/releases/download/v20230512.453/betaflight-configurator_10.10.0-debug-99730ef_linux64-portable.zip")
sha256sums=("e14a3ec73e68f186574731e9613c88cc45991f176acb33e271c4948960652fe4")
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
