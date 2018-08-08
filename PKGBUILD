# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Dave Blair <mail@dave-blair.de>

pkgname=autokey-py3
pkgver=0.95.2
pkgrel=5
pkgdesc="Python 3 port of AutoKey, a desktop automation utility for Linux and X11 with new features."
url="https://github.com/autokey/autokey"
depends=('python' 'wmctrl' 'hicolor-icon-theme' 'python-dbus' 'python-pyinotify'
  'zenity' 'xautomation' 'imagemagick' 'xorg-xwd' 'python-xlib' 'python-six'
  'python-gobject' 'gtksourceview3' 'libnotify' 'libappindicator-gtk3'
  'gtk-update-icon-cache')
makedepends=('python-setuptools')
optdepends=('kdialog: for Qt interface'
            'python-pyqt5: for Qt interface'
            'python-qscintilla-qt5: for Qt interface'
            'qt-at-spi: to work with KDE/Qt applications'
            'python-atspi-git: temporarily required for ATSPI in Gtk interface')
conflicts=('autokey' 'autokey-gtk' 'autokey-data')
license=('GPL3')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/autokey-py3/autokey/archive/v${pkgver}.tar.gz"
        "atspi.patch"
        "requires.patch")
sha256sums=('2354d0ea45b6d4dafdb9da9b9d046e204616f2612c8c21ac36550e88f362b499'
            '1e5014aec1a8a1b6bdb292e6c1c8133e885bfe9b5c04691e786393776f30b8fd'
            '4e33374c4eff96573ce92fda5e8263c8a610c9ba9fdce98046a0a3a05ac9a478')

prepare() {
    cd "$srcdir/autokey-${pkgver}"
    patch -Np1 -i ../requires.patch
    patch -Np1 -i ../atspi.patch
}

package() {
    cd "$srcdir/autokey-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
