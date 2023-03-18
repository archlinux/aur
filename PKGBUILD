# Maintainer: Malte Jürgens <maltejur@dismail.de>
# Contributor: Matthias Fulz < mfulz at olznet dot de >

pkgname=betaflight-configurator-nightlies-bin
_pkgname=betaflight-configurator
pkgver=v20230318.411
pkgrel=1
pkgdesc="Nightly builds of the Betaflight Configurator "
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator-nightlies"
source=("https://github.com/betaflight/betaflight-configurator-nightlies/releases/download/v20230318.411/betaflight-configurator_10.10.0-debug-43e080b_linux64-portable.zip")
sha256sums=("57a2398dd9c3f7c716ba4d68768ef34e9278964910ea9a40aa9dd96e7af1fea9")
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
