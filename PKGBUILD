# Contributor: Cillian Berragan <cjberragan@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=next-browser
pkgver=1.3.0
pkgrel=1
pkgdesc="Keyboard-oriented, Common Lisp extensible web-browser"
arch=('i686' 'x86_64')
url="https://next.atlas.engineer"
license=('custom:BSD')
source=("$pkgname-$pkgver::https://github.com/atlas-engineer/next/archive/$pkgver.tar.gz")
sha256sums=('e459c1f2432bfda853895417be94c6ea0a4254eb060a9a3f5a56491a17fd6da7')
# If someday Next works with other Lisps, replace 'sbcl' with 'common-lisp'.
makedepends=('sbcl' 'cl-asdf')
depends=('webkit2gtk' 'sqlite' 'glib-networking' 'gsettings-desktop-schemas' 'libfixposix')
optdepends=('gstreamer: for HTML5 audio/video'
            'gst-plugins-base: for HTML5 audio/video'
            'gst-plugins-good: for HTML5 audio/video'
            'gst-plugins-bad: for HTML5 audio/video'
            'gst-plugins-ugly: for HTML5 audio/video')
# Binary will not run otherwise.
options=('!strip' '!makeflags')

build() {
  cd ${pkgname%-browser}-$pkgver
  make all
}

package() {
  cd ${pkgname%-browser}-$pkgver
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
