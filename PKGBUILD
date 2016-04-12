# Maintainer: Joost Bremmer <toost dot b at gmail dot com>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=trackma-git
pkgver=0.4.r143.g5531f91
pkgrel=1
pkgdesc="A lightweight and simple program for updating and using lists on several media tracking websites."
arch=('any')
url="http://z411.github.io/trackma/"
license=('GPL3')
depends=('python2'
		 'lsof')
        
makedepends=('python2'
             'python2-setuptools'
             'desktop-file-utils'
             'git'
            )
optdepends=('pygtk: gtk frontend'
			'python2-pillow: thumbnail images for GUI frontends'
			'python2-pyqt5: Qt frontend'
            'python2-urwid: ncurses frontend'
			'python2-inotifyx: instant media recognition')

install=trackma-git.install
source=(${pkgname}::"git+https://github.com/z411/${pkgname%-git}.git"
       	"${pkgname%-git}-curses.desktop"
        "${pkgname%-git}-gtk.desktop"
		"${pkgname%-git}-qt.desktop")

sha256sums=('SKIP'
            'dfa7486230a44625406309437741cf31ab386fbb0d94907ed15aaa0b942e248a'
            '87fdf7251a244fd8a482f46e5b2dfd5fd1460d1fb38b47fff95478fe688cbdbd'
            '54281a11092b1d2737b6bca21c692ea9a63d7a2b85969124fd25e88170866799')

conflicts=('wmal-git')
replaces=('wmal-git')

pkgver() {
    cd ${pkgname}
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}


package() {
    cd ${pkgname}
    python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dvm644 "${pkgname%-git}/data/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dvm644 "${srcdir}"/trackma-curses.desktop "${pkgdir}"/usr/share/applications/${pkgname%-git}-curses.desktop
    install -vm644  "${srcdir}"/trackma-gtk.desktop "${pkgdir}"/usr/share/applications/${pkgname%-git}-gtk.desktop
    install -vm644  "${srcdir}"/trackma-qt.desktop "${pkgdir}"/usr/share/applications/${pkgname%-git}-qt.desktop
}
