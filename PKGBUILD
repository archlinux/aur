# Maintainer: Clover Yan <i at cloveryan dot com>

pkgname=cfca-seceditctladv-icbc
pkgver=3.3.0.2
pkgrel=1
pkgdesc='SecEditCtlAdv From CFCA for ICBC'
arch=('x86_64')
url='https://corporbank-simp.icbc.com.cn/'
license=('custom')
depends=('glibc' 'gcc-libs' 'dmidecode')
makedepends=('wget')
install='cfca-seceditctladv-icbc.install'
options=('!debug')
source=("https://corporbank-simp.icbc.com.cn/ebankc/safety/linux/uos/adv/UOS_SecEditCtlAdv.ICBC.x86_64.deb")
sha256sums=('bc7740b1d054e3d7b4e14064be7a5e806b684e96bd7580a9568a7ec62932a9c5')
noextract=('UOS_SecEditCtlAdv.ICBC.x86_64.deb')

DLAGENTS=('https::/usr/bin/wget -q -O %o %u')

package() {
    cd "$srcdir"

    bsdtar -xf UOS_SecEditCtlAdv.ICBC.x86_64.deb
    bsdtar -xf data.tar.xz -C "$pkgdir"

    install -d "$pkgdir/usr/lib/mozilla/plugins"
    install -m 755 "$pkgdir/opt/cfca/ICBC/SecEditCtlAdv/libnpSecEditCtlAdv-ICBC-plugin.so.3.3.0.2" \
        "$pkgdir/usr/lib/mozilla/plugins/libnpSecEditCtlAdv-ICBC-plugin.so"
    install -m 755 "$pkgdir/opt/cfca/ICBC/SecEditCtlAdv/libnpMsgEncCtlAdv-ICBC-plugin.so.3.3.0.2" \
        "$pkgdir/usr/lib/mozilla/plugins/libnpMsgEncCtlAdv-ICBC-plugin.so"
}
