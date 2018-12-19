# Maintainer: Joost Bremmer <toost dot b at gmail dot com>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=trackma-git
pkgver=0.7.6
pkgrel=2
pkgdesc="A lightweight and simple program for updating and using lists on several media tracking websites."
arch=('any')
url="http://z411.github.io/trackma/"
license=('GPL3')
depends=('python'
         'python-pyinotify')

makedepends=('python'
    'python-setuptools'
    'desktop-file-utils'
    'git'
    )
optdepends=('python-gobject: GTK frontend'
    'python-cairo:   GTK frontend'
    'python-pillow:  thumbnail images for GUI frontends'
    'python-pyqt5:   Qt frontend'
    'python-urwid:   ncurses frontend'
    'lsof:           polling tracker/pyinotify alternative')

source=(${pkgname}::"git+https://github.com/z411/${pkgname%-git}.git"
    "${pkgname%-git}-curses.desktop"
    "${pkgname%-git}-gtk.desktop"
    "${pkgname%-git}-qt.desktop")

sha256sums=('SKIP'
            '80be9ffc3eb66456004a438a3da8950ed8382faa00a3fe61c5ef3980090c4dce'
            'ec25ab92890b72b4a9334d13280bc889f53d91463f54a4de7120a594770718fa'
            'dbeb2e1980df220392fc0b41e6d2f6110f0d506282dfbfc84b354e20adb7bf84')

#old package name.
conflicts=('wmal-git')
replaces=('wmal-git')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

package() {
  cd ${pkgname}
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

  install -Dvm644 "${pkgname%-git}/data/icon.png" \
  "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"

  install -Dvm644 "${srcdir}/trackma-curses.desktop" \
  "${pkgdir}/usr/share/applications/${pkgname%-git}-curses.desktop"

  install -vm644  "${srcdir}/trackma-gtk.desktop" \
  "${pkgdir}/usr/share/applications/${pkgname%-git}-gtk.desktop"

  install -vm644  "${srcdir}/trackma-qt.desktop" \
  "${pkgdir}/usr/share/applications/${pkgname%-git}-qt.desktop"
}

# vim: sw=2 ts=2 tw=80 et:
