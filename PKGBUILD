# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname="dolphin-megasync"
pkgver=3.0.1
pkgrel=1
pkgdesc="Upload your files to your Mega account from Dolphin file manager."
arch=('i686' 'x86_64')
url="https://mega.co.nz/#sync"
license=('custom:The Clarified Artistic License')
depends=('megasync' 'dolphin')
source=("https://mega.nz/linux/MEGAsync/xUbuntu_17.04/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('050f33301972083f9d622d127ad566bc95ea33a33027b296b7668dbb9802c5ed')
install="${pkgname}.install"

build() {
	cd "${pkgname}-${pkgver}"
    rm CMakeLists.txt
    mv CMakeLists_kde5.txt CMakeLists.txt
    
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 644 megasync-plugin.desktop $pkgdir/usr/share/kservices5/ServiceMenus/megasync-plugin.desktop
    install -Dm 644 megasyncplugin.so $pkgdir/usr/lib/qt/plugins/megasyncplugin.so
    install -Dm 644 megasyncdolphinoverlayplugin.so $pkgdir/usr/lib/qt/plugins/kf5/overlayicon/megasyncdolphinoverlayplugin.so

    cd "data/emblems"
    for size in 32x32 64x64
    do
        install -dm 755 ${pkgdir}/usr/share/icons/hicolor/${size}/emblems
        install -m 644 -p ${size}/mega-dolphin-{pending,synced,syncing}.png ${pkgdir}/usr/share/icons/hicolor/${size}/emblems/
    done
}

# vim:set ts=4 sw=2 ft=sh et:
