# Maintainer: Cillian Berragan <cjberragan@gmail.com>

pkgname=next-browser-git
_pkgname=next-browser
pkgver=1.1.0.14.gc645350
pkgrel=1
pkgdesc="Keyboard-oriented, Common Lisp extensible web-browser"
arch=('i686' 'x86_64')
url="https://nyxt.atlas.engineer"
license=('BSD-3')
conflicts=('next-browser')
provides=('next-browser')
source=(${_pkgname}::git+https://source.atlas.engineer/public/nyxt)
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
	cd ${_pkgname}
	git describe --long --tags|tr - .
}

build() {
	cd ${_pkgname}
	make all
}

package() {
	cd ${_pkgname}
	make install PREFIX=/usr DESTDIR=${pkgdir}
}
