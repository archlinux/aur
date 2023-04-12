# Maintainer: Malte Jürgens <maltejur@dismail.de>
# Contributor: Matthias Fulz < mfulz at olznet dot de >

pkgname=betaflight-configurator-nightlies-bin
_pkgname=betaflight-configurator
pkgver=v20230412.435
pkgrel=1
pkgdesc="Nightly builds of the Betaflight Configurator "
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator-nightlies"
source=("https://github.com/betaflight/betaflight-configurator-nightlies/releases/download/v20230412.435/betaflight-configurator_10.10.0-debug-db97687_linux64-portable.zip")
sha256sums=("0cd113af46261ae117443e27ca3df0bc2b8b3fbf4121a083f0eaf7c63fa87fe8")
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
