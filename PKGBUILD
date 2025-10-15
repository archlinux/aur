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
pkgver=r22735.015591b90
pkgrel=1
pkgdesc="Jabber/XMPP instant messenger client written in Python with GTK+"
arch=('any')
url="https://gajim.org/"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'python-cairo' 'python-gobject' 'python-keyring' 'python-nbxmpp-git'
        'python-cryptography' 'python-precis_i18n' 'python-css-parser' 'python-distro' 'hicolor-icon-theme'
        'python-pillow' 'python-gssapi' 'python-netifaces' 'python-qrcode' 'python-omemo-dr' 'python-packaging'
        'pango' 'sqlite' 'python-sqlalchemy' 'python-setuptools' 'python-emoji' 'python-httpx' 'python-truststore'
        'python-h2' 'python-socksio')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-sentry_sdk: for Sentry error reporting to dev.gajim.org (users decide whether to send reports or not)'
            'libspelling: for spell checking support'
            'libsecret: for GNOME Keyring or KDE support as password storage'
            'gupnp-igd: for better NAT traversing'
            'networkmanager: for network lose detection'
            'geoclue2: share current location'
            'gsound: Notification Sounds'
            'farstream: for video and audio calls'
            'gstreamer: for video and audio calls'
            'gst-plugins-base: for video and audio calls'
            'gst-plugins-ugly: for video and audio calls'
            'gst-libav: for video and audio calls'
            'gst-plugin-gtk4: for video and audio calls'
            'libxss: for idle time checking on X11'
            'python-gnupg: encrypting chat messages with OpenPGP'
            'emoji-font: for emojis support')
provides=('gajim')
conflicts=('gajim' 'gajim-hg' 'gajim-svn')
replaces=('gajim-hg' 'gajim-svn')
source=("$_name::git+https://dev.gajim.org/gajim/gajim.git")
md5sums=('SKIP')

pkgver() {
  cd $_name
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_name

  ./make.py build --dist unix
  python -m build --wheel --no-isolation
}

package() {
  cd $_name

  python -m installer --destdir="$pkgdir" dist/*.whl
  ./make.py install --dist unix --prefix="${pkgdir}/usr"
}
