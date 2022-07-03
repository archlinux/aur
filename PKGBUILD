# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=authpass-bin
_pkgname="${pkgname%-bin}"
pkgver=1.9.7
_rev=1940
pkgrel=1
pkgdesc='Keepass compatible password manager based on Flutter'
arch=('x86_64')
url='https://github.com/authpass/authpass'
license=('GPL3')
depends=('gtk3' 'libsecret' 'libkeybinder3')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-${pkgver}_${_rev}.tar.gz"
  "$_pkgname-$pkgver.svg::$url/raw/v$pkgver/_docs/authpass-logo.svg"
  "${_pkgname}.desktop")
sha256sums=('c39456ab421d2c279555ec3bd81de3ac41cb720c49eff1cee82979fd50b30409'
            '1bfe9685c9399976a872bfcafbe19c16b26063530cdc9184570270d52fe7851b'
            '8260ede1bb38264aa92227dee1b3edd0d66b1f963872d4254549c08c7ca409dd')

package() {
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$_pkgname-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
  install -d "$pkgdir/opt/$_pkgname/"
  install -d "$pkgdir/usr/bin/"
  cp -a --no-preserve=ownership authpass/* "$pkgdir/opt/$_pkgname/"
  ln -s "/opt/$_pkgname/$_pkgname" -t "$pkgdir/usr/bin/"
  chown -R root:root "$pkgdir/"
}

# vim: ts=2 sw=2 et:
