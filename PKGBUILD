# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=authpass-bin
_pkgname="${pkgname%-bin}"
pkgver=1.8.0
pkgrel=1
pkgdesc='Keepass compatible password manager based on Flutter'
arch=('x86_64')
url='https://authpass.app'
license=('GPL3')
depends=('gtk3' 'libsecret')
makedepends=('gendesk')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/authpass/authpass/releases/download/v$pkgver/$_pkgname-linux-${pkgver}_1710.tar.gz"
        "$_pkgname-$pkgver.svg::https://raw.githubusercontent.com/authpass/authpass/v$pkgver/_docs/authpass-logo.svg")
sha256sums=('c8741ec35b565151d514013d7578e17cf1c77d1fb4d15286e70728401755d2f6'
            '1bfe9685c9399976a872bfcafbe19c16b26063530cdc9184570270d52fe7851b')

prepare() {
  gendesk -f -n \
    --pkgname="$_pkgname" \
    --pkgdesc="$pkgdesc" \
    --name="AuthPass" \
    --comment="$pkgdesc" \
    --exec="$_pkgname" \
    --icon="$_pkgname" \
    --categories='Utility'
}

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
