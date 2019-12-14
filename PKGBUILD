PACKAGER='Simone Scalabrino <s.scalabrino9@gmail.com>'
pkgname=silos
_gitname=pyqtws
_gittag=0.1.28
pkgver=$_gittag
pkgrel=1
pkgdesc='Web-app container, with multimedia apps (YouTube, Netflix, Twitch, VVVVID, and RaiPlay),  productivity suites (Microsoft Office 365, Skype, Google Office, and Gmail), and others (WhatsApp web and Wikipedia)'
arch=('i686' 'x86_64')
url='https://github.com/intersimone999/pyqtws'
license=('MIT')
depends=('xdg-utils' 'qt5-webengine' 'python' 'python-pip' 'libnotify' 'python-pyqtwebengine' 'python-qtpy' 'python-gobject' 'python-pystray')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_gitname}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_gitname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    
    mkdir -p "${pkgdir}/usr/share/pixmaps/silos"
    
    for f in ${srcdir}/pyqtws/pyqtws/icons/*.svg
    do
        target=$(basename "$f")
        install -Dm755 "$f" "${pkgdir}/usr/share/pixmaps/silo-$target"
    done
    
    for f in ${srcdir}/pyqtws/pyqtws/desktops/*.desktop
    do
        target=$(basename "$f")
        install -Dm755 "$f" "${pkgdir}/usr/share/applications/silo-$target"
    done
}
