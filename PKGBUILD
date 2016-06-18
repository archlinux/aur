# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Dave Blair <mail@dave-blair.de>
pkgname=autokey-py3
pkgver=0.93.4
pkgrel=4
pkgdesc="Python 3 port of AutoKey, a desktop automation utility for Linux and X11 with new features."
url="https://github.com/guoci/autokey-py3"
depends=('python' 'wmctrl' 'hicolor-icon-theme' 'python-dbus' 'python-pyinotify' \
  'zenity' 'xautomation' 'imagemagick' 'xorg-xwd' 'python-xlib')
optdepends=('python-gobject: for GTK GUI'
            'gtksourceview3: for GTK GUI'
            'libnotify: for GTK GUI'
            'python-qscintilla: for QT GUI'
            'kdebindings-python: for QT GUI')
conflicts=('autokey' 'autokey-gtk' 'autokey-qt' 'autokey-data')
license=('GPL3')
arch=('any')
source=('https://pypi.python.org/packages/source/a/autokey-py3/autokey-py3-0.93.4.tar.gz'
        'setup-kde4-fix.patch')
sha256sums=('ccc2888675f5984942b78c1ea40985b08efc32214a9d0f96b7ad54ef842df1a1'
            'd117331d6024049e4557e485d1669d28b16ab75d8ef55a4fcb2243828bc9f956')
install=$pkgname.install

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p0 -i ../setup-kde4-fix.patch
}


build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
