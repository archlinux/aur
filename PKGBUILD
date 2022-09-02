# Maintainer: TF <mail | at | sedi [DOT] one>
pkgname=avast-gui
pkgver=0.2.0
pkgrel=3
arch=('x86_64')
pkgdesc='Avast Antivirus GUI (unofficial)'
depends=("yad" "curl" "avast>=4.1.0" "avast-fss>=4.1.0")
optdepends=("avast-rest>=4.1.0")
_vertype="ALPHA"
url='https://www.avast.com/business/products/linux-antivirus'
license=('GPL2')
#install=${pkgname}.install
source=(
        "https://static3.avast.com/10002535/web/i/v2/components/logos/avast-logos/avast-logo-inverse.svg"
        "https://static3.avast.com/10002535/web/i/v2/components/logos/avast-logos/avast-logo-business.svg"
        "avast-logo-transp.png::https://img.informer.com/icons_mac/png/128/580/580294.png"
        "git+https://github.com/secure-diversITy/avast-gui.git"
        )
#         "${pkgname}.install")
sha256sums=('63b2334f1a7b6023acc55f36fc44424d050c65bf421ca871ebcf967e1dea7ff6'
            '7404130ed0154296a67713b1a7421336482ee8bdc1c4e90327c4ae666e7b31f5'
            '808451b4f82dec1e463428f0fdc0ea783955d36df96ad6e50d6fae877c39f7b7'
            'SKIP')
validpgpkeys=('6AFE173577C4CBD621DF217FD093435AA3ED2C4A')

package() {
    # prep
    mkdir -p $pkgdir/usr/share/$pkgname/icons $pkgdir/usr/share/applications/ $pkgdir/usr/share/$pkgname/desktopfiles/

    # install the Avast icons
    cp $srcdir/avast-logo-inverse.svg $pkgdir/usr/share/$pkgname/icons/icon.svg
    cp $srcdir/avast-logo-business.svg $pkgdir/usr/share/$pkgname/icons/icon-biz.svg
    cp $srcdir/avast-logo-transp.png $pkgdir/usr/share/$pkgname//icons/icon-transp.png

    # install the yad wrapper
    install -Dm755 avast-gui/$pkgname.in $pkgdir/usr/bin/$pkgname
    sed -i "s/%VER%/${pkgver}-${_vertype}/g" $pkgdir/usr/bin/$pkgname

    # install application shortcut
    install -Dm755 avast-gui/$pkgname.desktop $pkgdir/usr/share/applications/

    # install menu items for the main window
    install -Dm755 avast-gui/desktopfiles/* $pkgdir/usr/share/$pkgname/desktopfiles/
    install -Dm644 avast-gui/icons/* $pkgdir/usr/share/$pkgname/icons/

    # install lic
    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    install -Dm644 avast-gui/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
