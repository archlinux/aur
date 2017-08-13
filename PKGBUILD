# Maintainer: Luca Cristiano<lucamaker@gmail.com>
pkgname="openminemods"
pkgver=1.0.1
pkgrel=2
pkgdesc="An open source, GNU plus Linux compatible alternative to the Twitch Launcher"
arch=('any')
url="https://github.com/joonatoona/OpenMineMods/tree/v1.0.1"
license=('GNU Affero GPL')
groups=()
depends=('python3' 'python-beautifulsoup4' 'python-pyqt5' 'python-requests')
makedepends=('git' 'imagemagick' 'gendesk')
optdepends=('multimc: the program just manages MultiMC instances for you. You will want this to actually run the 
packs.')
provides=("openminemods")
conflicts=("openminemods")
replaces=()
backup=()
options=()
install=
source=('openminemods::git+https://github.com/joonatoona/OpenMineMods#tag=v1.0.1')
noextract=()
md5sums=('SKIP')

build() {
    cd "$pkgname"
    convert OMM.ico OMM.png
    gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name="Open Mine Mods" --exec="omm-ui" --categories="Application;Game"
    echo -e "#!/bin/bash\npython3 /opt/openminemods/openminemods/GUI.py" > omm-ui
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "$pkgdir/opt/$pkgname"
    cp -R "$srcdir/$pkgname/" "$pkgdir/opt/$pkgname"
    install -Dm644 "./OMM.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -D "./$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm755 "./omm-ui" "$pkgdir/usr/bin/omm-ui"
}
