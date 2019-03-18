# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=gnome-shell-extension-cast-to-tv
pkgver=8
pkgrel=1
pkgdesc="Cast files to your Chromecast or other devices over local network"
arch=('any')
url="https://github.com/Rafostar/$pkgname"
license=('GPL')
depends=('gnome-shell' 'ffmpeg')
makedepends=('npm' 'gettext')
source=("https://github.com/Rafostar/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1c37ea56c9d38950016d8a469e7ee13ff342e6773b6793d2ded0cc1bd118d48e')

build() {
  cd "$pkgname-$pkgver"

  make compilemo
  npm install
}

package() {
  cd "$pkgname-$pkgver"
  uuid="cast-to-tv@rafostar.github.com"

  install -dm755 "$pkgdir/usr/share/gnome-shell/extensions/$uuid"
  cp -r *.js *.json webplayer "$pkgdir/usr/share/gnome-shell/extensions/$uuid/"

  install -dm755 "$pkgdir/usr/share/locale"
  cp -r locale/* "$pkgdir/usr/share/locale/"

  install -Dm644 "schemas/org.gnome.shell.extensions.cast-to-tv.gschema.xml" \
    "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.cast-to-tv.gschema.xml"
}
