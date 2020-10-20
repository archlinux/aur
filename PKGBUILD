# Maintainer: Cillian Berragan <cjberragan@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

_pkgname=nyxt-browser
pkgname=$_pkgname-git
pkgver=1.5.0.r1236.g10fdbf5b
pkgrel=1
pkgdesc="Keyboard-oriented, Common Lisp extensible web-browser"
arch=('i686' 'x86_64')
url="https://nyxt.atlas.engineer"
license=('BSD-3')
conflicts=('nyxt-browser')
provides=('nyxt-browser' 'next-browser')
source=($_pkgname::git+https://github.com/atlas-engineer/nyxt.git)
sha256sums=('SKIP')
# If someday Next works with other Lisps, replace 'sbcl' with 'common-lisp'.
makedepends=('git' 'sbcl' 'cl-asdf')
depends=('webkit2gtk' 'glib-networking' 'gsettings-desktop-schemas' 'libfixposix' 'enchant')
optdepends=('gstreamer: for HTML5 audio/video'
            'gst-plugins-base: for HTML5 audio/video'
            'gst-plugins-good: for HTML5 audio/video'
            'gst-plugins-bad: for HTML5 audio/video'
            'gst-plugins-ugly: for HTML5 audio/video')
# Binary will not run otherwise.
options=('!strip' '!makeflags')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
  cd "$srcdir/$_pkgname"
  make all
}

package() {
  cd "$srcdir/$_pkgname"
  make install PREFIX=/usr DESTDIR=${pkgdir}
  install -Dm644 licenses/ASSET-LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/licenses/ASSET-LICENSE
}
