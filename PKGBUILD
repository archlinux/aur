# Maintainer: Bjoern Franke <bjo at nord-west.org>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Benjamin Richter <br@waldteufel-online.net>
# Contributor: Changaco <changaco@changaco.net>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer [at] student [dot] tugraz [dot] at>

pkgname=gajim-hg
pkgrel=1
pkgver=15618.2dc6bce0eddc
pkgdesc="Jabber/XMPP instant messenger client written in PyGTK"
arch=('i686' 'x86_64')
url="http://hg.gajim.org/gajim"
license=('GPL3')
depends=('pygtk' 'python2-pyopenssl' 'dnsutils' 'hicolor-icon-theme' 'python2-pyasn1' 'python2-nbxmpp-hg')
makedepends=('mercurial' 'intltool')
optdepends=(
'dbus-python: dbus support'
'farstream-0.1: for video/voice support'
'gstreamer0.10-bad: for video/voice support'
'gstreamer0.10-python: for video/voice support'
'gtkspell: for spelling support'
'libxss: for idle module'
'notification-daemon: for desktop notification'
'python2-gnomekeyring: for GnomeKeyring support'
'python2-crypto: support for E2E encryption'
'python2-docutils: for RST generator support'
'gupnp-igd: for UPnP-IGD support')
provides=('gajim')
conflicts=('gajim' 'gajim-svn')
replaces=('gajim-svn')
install=gajim.install
source=('gajim-hg::hg+http://hg.gajim.org/gajim#branch=gajim_0.16')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}




build() {
    cd "${srcdir}/${pkgname}"
    export PYTHON=`which python2`
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}/" install
}
