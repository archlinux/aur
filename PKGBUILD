# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=gnome-shell-extension-cast-to-tv
pkgver=9
pkgrel=1
pkgdesc="Cast files to your Chromecast or other devices over local network"
arch=('any')
url="https://github.com/Rafostar/$pkgname"
license=('GPL')
depends=('gnome-shell' 'ffmpeg')
optdepends=(
  'python-nautilus: Nautilus integration'
)
makedepends=('npm' 'gettext')
source=("https://github.com/Rafostar/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b67df23d85de7feb779cda4872e54a59b521e789a7183f60f5fdd297dcc746db')

build() {
  cd "$pkgname-$pkgver"

  make compilemo
  npm install
}

package() {
  cd "$pkgname-$pkgver"
  uuid="cast-to-tv@rafostar.github.com"

  install -dm755 "$pkgdir/usr/share/gnome-shell/extensions/$uuid"
  install -dm777 "$pkgdir/usr/share/gnome-shell/extensions/$uuid/config"
  cp -r *.js *.json appIcon node_scripts webplayer "$pkgdir/usr/share/gnome-shell/extensions/$uuid/"

  install -dm755 "$pkgdir/usr/share/locale"
  cp -r locale/* "$pkgdir/usr/share/locale/"

  install -Dm644 "schemas/org.gnome.shell.extensions.cast-to-tv.gschema.xml" \
    "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.cast-to-tv.gschema.xml"

  install -Dm644 nautilus/nautilus-cast-to-tv.py -t "$pkgdir/usr/share/nautilus-python/extensions/"
}
