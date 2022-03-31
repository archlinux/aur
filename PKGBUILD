# Maintainer: Dct Mei <dctxmei@yandex.com>
# Contributor: Eric S. Londres <elondres@stevens.edu>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Cillian Berragan <cjberragan@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=nyxt
pkgver=2.2.4
pkgrel=2
pkgdesc="A keyboard-oriented, infinitely extensible web browser designed for power users"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/atlas-engineer/nyxt"
license=('custom:BSD')
depends=('enchant' 'glib-networking' 'gobject-introspection-runtime' 'gsettings-desktop-schemas' 'libfixposix' 'webkit2gtk-4.1')
# If someday Nyxt works with other Lisps, replace 'sbcl' with 'common-lisp'.
makedepends=('cl-asdf' 'git' 'gobject-introspection-runtime' 'sbcl')
optdepends=('gstreamer: for HTML5 audio/video'
            'gst-plugins-base: for HTML5 audio/video'
            'gst-plugins-good: for HTML5 audio/video'
            'gst-plugins-bad: for HTML5 audio/video'
            'gst-plugins-ugly: for HTML5 audio/video')
provides=('nyxt-browser')
conflicts=('nyxt-browser')
# Binary will not run otherwise.
options=('!strip' '!makeflags')
source=("git+https://github.com/atlas-engineer/nyxt.git#tag=${pkgver}")
b2sums=('SKIP')

build() {
    cd "${srcdir}"/"${pkgname}"/
    make all
}

package() {
    cd "${srcdir}"/"${pkgname}"/
    make install PREFIX=/usr DESTDIR="${pkgdir}"/
    install -Dm 644 licenses/ASSET-LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    install -Dm 644 licenses/SOURCE-LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
