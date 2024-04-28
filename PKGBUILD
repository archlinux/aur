# Maintainer: Azure <azure@fox.blue>
# Contributor: Inkeso
# Based on gajim-git by:
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>
# Contributor: Bjoern Franke <bjo at nord-west.org>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Benjamin Richter <br@waldteufel-online.net>
# Contributor: Changaco <changaco@changaco.net>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer [at] student [dot] tugraz [dot] at>

_name=gajim
pkgname="$_name-1.3"
epoch=1
pkgver=1.3.3
pkgrel=5
pkgdesc="Jabber/XMPP instant messenger client written in Python with GTK+, version 1.3 (Multiwindow)"
arch=('any')
url="https://gajim.org/"
license=('GPL3')
depends=('gtk3' 'libsoup' 'python-gobject' 'python-pyopenssl' 'hicolor-icon-theme'
         'python-pyasn1' 'python-nbxmpp-2.0' 'python-cairo' 'python-keyring'
         'python-distro' 'python-css-parser' 'python-precis_i18n' 'python-pillow'
         'gtksourceview4')
makedepends=('git' 'python-setuptools')
optdepends=('python-dbus: for gajim-remote and zeroconf support'
            'farstream: for video/voice support'
            'gst-plugins-good: for video/voice support'
            'gst-plugins-bad: for video/voice support'
            'gst-plugins-ugly: for video/voice support'
            'gst-libav: for video/voice support'
            'gst-python: for video/voice support'
            'gst-plugin-gtk: for video support'
            'gsound: for notification sounds'
            'gspell: for spell checking support'
            'libxss: for idle time checking on X11'
            'libappindicator-gtk3: to get a tray icon on some desktop environments'
            'notification-daemon: for desktop notifications'
            'gnome-keyring: store passwords encrypted in GNOME Keyring'
            'kded5: store passwords encrypted in KSecretService'
            'python-crypto: support for E2E encryption'
            'python-docutils: for RST generator support'
            'geoclue2: for sharing your location')
provides=('gajim')
conflicts=('gajim' 'gajim-hg' 'gajim-svn' 'gajim-git')
replaces=('gajim-hg' 'gajim-svn')
source=("$_name::git+https://dev.gajim.org/gajim/gajim.git#tag=gajim-1.3.3"
        "gupnp-disable.patch"
	"getfullargspec.patch")
md5sums=('SKIP'
         'f0582899b5c0d096171fbdbc4c6bf1df'
         '0ad35d6309caefe9737b706d3a5b4f2c')

prepare() {
    cd "$_name"
    patch --forward --strip=1 --input="${srcdir}/gupnp-disable.patch"
    patch --forward --strip=1 --input="${srcdir}/getfullargspec.patch"
}

package() {
  cd "$_name"
  python setup.py install --root="$pkgdir/" --optimize=1
}
