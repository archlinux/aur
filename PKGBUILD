# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Co-Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>
# Contributor: Bjoern Franke <bjo at nord-west.org>
# Contributor: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Benjamin Richter <br@waldteufel-online.net>
# Contributor: Changaco <changaco@changaco.net>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer [at] student [dot] tugraz [dot] at>

_name=gajim
pkgname="$_name-git"
epoch=1
pkgver=r20795.56ad85842
pkgrel=2
pkgdesc="Jabber/XMPP instant messenger client written in Python with GTK+"
arch=('any')
url="https://gajim.org/"
license=('GPL3')
depends=('gtk3' 'libsoup' 'python-gobject' 'python-pyopenssl' 'hicolor-icon-theme'
         'python-pyasn1' 'python-nbxmpp-git' 'python-cairo' 'python-keyring'
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
            'kded: store passwords encrypted in KSecretService'
            'python-crypto: support for E2E encryption'
            'python-docutils: for RST generator support'
            'gupnp-igd: for UPnP-IGD support'
            'geoclue2: for sharing your location')
provides=('gajim')
conflicts=('gajim' 'gajim-hg' 'gajim-svn')
replaces=('gajim-hg' 'gajim-svn')
source=("$_name::git+https://dev.gajim.org/gajim/gajim.git/")
md5sums=('SKIP')

pkgver() {
  cd $_name
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
  ./pep517build/build_metadata.py -o dist/metadata
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  ./pep517build/install_metadata.py --prefix="$pkgdir/usr" dist/metadata
}
