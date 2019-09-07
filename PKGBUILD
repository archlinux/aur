# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Maintainer: Facundo Tuesca  <facutuesca AT gmail DOT com>

pkgname=iscan-plugin-v330
pkgver=1.0.0
pkgrel=1
pkgdesc="EPSON Image Scan! plugin for Epson scanners GT-F730, GT-S630, Perfection V33, Perfection V330 Photo"
_plugin="perfection-v330"
_iscan_ver=2.30.4
arch=('x86_64')
url="http://support.epson.net/linux/en/iscan.php?model=perfection-v330"
license=('custom')
depends=('iscan')
install="${pkgname}.install"
source=("https://download2.ebz.epson.net/iscan/plugin/perfection-v330/rpm/x64/iscan-${_plugin}-bundle-${_iscan_ver}.x64.rpm.tar.gz")
sha256sums=('38082e6c080fbbfb96fa005bd8e42b36728ad6ebeff5084b677b3ee6ea2b389a')

prepare() {
    cd "iscan-${_plugin}-bundle-${_iscan_ver}.x64.rpm/plugins"
    bsdtar -xf "esci-interpreter-${_plugin}-${pkgver}-1.${CARCH}.rpm"
}

package() {
    cd "iscan-${_plugin}-bundle-${_iscan_ver}.x64.rpm/plugins/usr"
    # install plugin
    install -Dm 755 -t "${pkgdir}/usr/lib/esci" "lib64/esci/libesci-interpreter-${_plugin}.so.0.0.0"
    ln -s "libesci-interpreter-${_plugin}.so.0.0.0" "${pkgdir}/usr/lib/esci/libesci-interpreter-${_plugin}.so"
    ln -s "libesci-interpreter-${_plugin}.so.0.0.0" "${pkgdir}/usr/lib/esci/libesci-interpreter-${_plugin}.so.0"    
    # install firmware
    install -Dm 644 -t "${pkgdir}/usr/share/esci" "share/esci/esfwad.bin"
    # install shared data
    install -Dm 644 -t "${pkgdir}/usr/share/iscan-data/device" share/iscan-data/device/{47542d46373330,47542d53363330}.xml
    # install license
	install -Dm 644 "share/doc/esci-interpreter-${_plugin}-${pkgver}/COPYING.EPSON.en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON"
}
