# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=gnome-shell-extension-cast-to-tv
pkgver=5
pkgrel=1
pkgdesc="Cast files to your Chromecast or other devices over local network"
arch=('any')
url="https://github.com/Rafostar/$pkgname"
license=('GPL')
depends=('gnome-shell' 'ffmpeg')
makedepends=('npm' 'gettext')
source=("https://github.com/Rafostar/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0ccfc6b5f55b2f9e468170bcae0df34e9cc744366583192969f4831049016902')

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
