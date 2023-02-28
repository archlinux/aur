# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator-bin
_pkgname=betaflight-configurator
pkgver=10.9.0
pkgrel=2
pkgdesc="Crossplatform configuration tool for the Betaflight flight control system"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
source=("https://github.com/betaflight/betaflight-configurator/releases/download/$pkgver/betaflight-configurator_"$pkgver"_linux64-portable.zip")
sha256sums=('f45cccc81211daed735c7b5358900133a445d7e3b28d87443e5470b6283d6e52')
options=(!strip)
license=('GPL3')
conflicts=('betaflight-configurator')
install=$pkgname.install

package() {
  mkdir -p "$pkgdir/opt/betaflight"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Betaflight Configurator/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  cp -dpr --no-preserve=ownership "$srcdir/Betaflight Configurator" "$pkgdir/opt/betaflight/betaflight-configurator"
  ln -s "/opt/betaflight/betaflight-configurator/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  # Perm fixes https://github.com/betaflight/betaflight-configurator/issues/3009#issuecomment-1260777532
  chmod +xr /opt/betaflight/betaflight-configurator/chrome_crashpad_handler
  chmod +xr /opt/betaflight/betaflight-configurator/betaflight-configurator
  chmod -R +Xr /opt/betaflight/betaflight-configurator/
}

