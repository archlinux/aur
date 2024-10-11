# Maintainer: Kubander <jakub.hosek@prihradka.cz>
# Contributor poliecho <poliecho@pupes.org>

pkgname=freakfox-git
_pkgname=freakfox
pkgver=1.0.r0.g$(git rev-parse --short HEAD)
pkgrel=1
pkgdesc="Mega Freaky web browser"
url="https://github.com/1-K-SSPS/freakfox.git"
license=('freakyGPL')
depends=(
    'python'
    'python-pip'
    'python-pyqt5'
    'python-pyqt5-webengine'
    'python-pygame'
    'python-requests'
)
arch=('any')
makedepends=('git')
source=("git+https://github.com/1-K-SSPS/freakfox.git")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$_pkgname/src"
    cat > freakfox.desktop << EOL
[Desktop Entry]
Name=Freakfox
Exec=freakfox
Icon=freakfox_icon
Type=Application
Terminal=false
Categories=GNOME;GTK;Network;WebBrowser;
EOL
}

package() {
    cd "$srcdir/$_pkgname/src"

    install -Dm755 browser.py "$pkgdir/usr/share/freakfox/browser.py"
    install -Dm644 *.png "$pkgdir/usr/share/freakfox/"
    install -Dm644 *.jpg "$pkgdir/usr/share/freakfox/"
    install -Dm644 *.mp3 "$pkgdir/usr/share/freakfox/"
    install -Dm644 index.html "$pkgdir/usr/share/freakfox/index.html"
    install -Dm644 style.css "$pkgdir/usr/share/freakfox/style.css"
    install -Dm644 balance.txt "$pkgdir/usr/share/freakfox/balance.txt"

    install -Dm644 freakfox.desktop "$pkgdir/usr/share/applications/freakfox.desktop"
    install -Dm644 freakfox_icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/freakfox_icon.png"

    cat > freakfox << EOL
#!/bin/sh
python /usr/share/freakfox/browser.py
EOL
    install -Dm755 freakfox "$pkgdir/usr/bin/freakfox"
}
