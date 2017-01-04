# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Bjoern Franke <bjo at nord-west.org>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Benjamin Richter <br@waldteufel-online.net>
# Contributor: Changaco <changaco@changaco.net>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer [at] student [dot] tugraz [dot] at>

_name=gajim
pkgname="$_name-git"
pkgver=r14131.90a80feda
pkgrel=1
pkgdesc="Jabber/XMPP instant messenger client written in Python with GTK+"
arch=('any')
url="https://gajim.org/"
license=('GPL3')
depends=('python-gobject' 'python-pyopenssl' 'hicolor-icon-theme'
         'python-pyasn1' 'python-nbxmpp' 'python-cairo' 'libsecret')
makedepends=('git' 'intltool')
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
conflicts=('gajim' 'gajim-hg' 'gajim-svn')
replaces=('gajim-hg' 'gajim-svn')
source=("$_name::git+http://dev.gajim.org/gajim/gajim")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_name"
  ./autogen.sh --prefix=/usr --enable-site-packages
  make
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir/" install
}
