# Maintainer: Matt Shearing <matt@block-sense.io>
pkgname=bread-of-life-bin
_appname=bread-of-life
pkgver=0.3.3
pkgrel=1
pkgdesc='A warm, offline-first Bible homebase — reading, journalling, and an answered-prayer log you can look back on'
arch=('x86_64')
url='https://github.com/matt-shearing/bread-of-life'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=("$_appname=$pkgver")
conflicts=("$_appname")
options=('!strip' '!debug')
source=("$_appname-$pkgver.deb::$url/releases/download/v$pkgver/Bread.of.Life_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/matt-shearing/bread-of-life/v$pkgver/LICENSE")
noextract=("$_appname-$pkgver.deb")
sha256sums=('a3e4bef624240e25f67ecf335e00fb0d30aa3e5d5653a824c6100af5c171d4bd'
            'c2f7088783011edc2e0e390ca43e79f894fef1bb3ad356b79665b2dd227f82c9')

package() {
  # The prebuilt .deb already lays files out under /usr — extract its payload.
  bsdtar -xOf "$_appname-$pkgver.deb" data.tar.gz | bsdtar -xf - -C "$pkgdir"

  # Tauri ships the launcher as "Bread of Life.desktop"; normalise the name.
  mv "$pkgdir/usr/share/applications/Bread of Life.desktop" \
     "$pkgdir/usr/share/applications/$_appname.desktop"

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
