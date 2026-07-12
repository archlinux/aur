# Maintainer: Matt Shearing <matt@block-sense.io>
pkgname=bread-of-life-bin
_appname=bread-of-life
pkgver=0.3.6
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
sha256sums=('31bd377b8fec00f093826133bf7678322bdc8c7deed091ea94becc1118ba3f27'
            'c2f7088783011edc2e0e390ca43e79f894fef1bb3ad356b79665b2dd227f82c9')

package() {
  # The prebuilt .deb already lays files out under /usr — extract its payload.
  bsdtar -xOf "$_appname-$pkgver.deb" data.tar.gz | bsdtar -xf - -C "$pkgdir"

  # Tauri ships the launcher as "Bread of Life.desktop"; normalise the name.
  mv "$pkgdir/usr/share/applications/Bread of Life.desktop" \
     "$pkgdir/usr/share/applications/$_appname.desktop"

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
