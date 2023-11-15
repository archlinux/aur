# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=singboxclient
pkgver=1.2_beta4
pkgrel=1
pkgdesc="Cross platform client for sing-box"
arch=(x86_64)
url='https://github.com/daodao97/SingBoxClient'
license=('unknown')
depends=('ayatana-ido' 'libayatana-indicator' 'libdbusmenu-glib' 'libayatana-appindicator')
makedepends=('go')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
conflicts=(${pkgname}-git)
options=(!strip)
source=(
    "https://github.com/daodao97/SingBoxClient/archive/refs/heads/master.zip"
    "singboxclient.desktop"
)
sha256sums=(
    "SKIP"
    "120e2ee5bf52d7c6bf8f40af5dbc8458473539a82fd77c6d00100e3d26b4d3f3"
)

prepare() {
    cd "$srcdir/SingBoxClient-master"
    git init
    sed -i 's/musl/gnu/g' build.sh
    sed -i 's/open build//g' build.sh
}

build() {
    cd "$srcdir/SingBoxClient-master"
    sh build.sh -p linux
}

package() {
    cd "$srcdir/SingBoxClient-master"
    install -Dm755 sbox "$pkgdir/usr/bin/${pkgname}";
    install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/SingBoxClient-master/icon/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
