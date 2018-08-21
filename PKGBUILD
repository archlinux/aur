# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Dave Blair <mail@dave-blair.de>

pkgname=autokey-py3
pkgver=0.95.3
pkgrel=1
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
        "requires.patch")
sha256sums=('895749bfcc515d6bdeacc3192afba4263e91a8ad6ee9db42b983db67da3b847c'
            'b904d9e336e5fa6480820148e4394aedfbfa2d3662b1ae38d03a200a9bcbbdd8')

prepare() {
    cd "$srcdir/autokey-${pkgver}"
    patch -Np1 -i ../requires.patch
}

package() {
    cd "$srcdir/autokey-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
