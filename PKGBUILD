# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Bjoern Franke <bjo at nord-west.org>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Benjamin Richter <br@waldteufel-online.net>
# Contributor: Changaco <changaco@changaco.net>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer [at] student [dot] tugraz [dot] at>

pkgname=gajim-hg
pkgrel=1
pkgver=16204.6068cd819e0b
pkgdesc="Jabber/XMPP instant messenger client written in PyGTK"
arch=('any')
url="http://hg.gajim.org/gajim"
license=('GPL3')
depends=('python-gobject' 'python-pyopenssl' 'hicolor-icon-theme'
         'python-pyasn1' 'python-nbxmpp' 'python-cairo' 'libsecret')
makedepends=('mercurial' 'intltool')
optdepends=('python-dbus: dbus support'
            'farstream: for video/voice support'
            'gst-plugins-bad: for video/voice support'
            'gst-python: for video/voice support'
            'gtkspell3: for spelling support'
            'libxss: for idle module'
            'notification-daemon: for desktop notification'
            'gnome-keyring: to store passwords encrypted in GNOME Keyring'
            'kded: to store passwords encrypted in KSecretService'
            'python-crypto: support for E2E encryption'
            'python-docutils: for RST generator support'
            'gupnp-igd: for UPnP-IGD support')
provides=('gajim=0.17')
conflicts=('gajim' 'gajim-svn')
replaces=('gajim-svn')
source=("$pkgname::hg+http://hg.gajim.org/gajim#branch=default")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --prefix=/usr --enable-site-packages
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
