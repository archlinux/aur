#!/bin/bash
# Maintainer: Nissar Chababy <funilrys at outlook dot com>

_pkg_short_name='kaku'

pkgname=kaku-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="The next generation music client."
arch=('x86_64' 'i686')
url="http://kaku.rocks"
license=('MIT')
depends=('gconf' 'gtk2' 'fuse' 'xdg-utils' 'libxtst' 'libxss' 'nss' 'alsa-lib')
conflicts=('kaku')
install='kaku-bin.install'
options=(!strip)

source=("https://raw.githubusercontent.com/EragonJ/Kaku/master/LICENSE" "http://kaku.rocks/public/img/logo.png")
source_x86_64=("https://github.com/EragonJ/Kaku/releases/download/$pkgver/Kaku-$pkgver.tar.gz")
source_i686=("https://github.com/EragonJ/Kaku/releases/download/$pkgver/Kaku-$pkgver-ia32.tar.gz")

sha512sums=('354016d1de60b330e50f996dcdf61989091b44b28f096f7cb83f83c006cb2d51ef3da94a49d2ba73b71bc294a206a524d38a6b3c0f5bf1cc3ac6048d57624b04' 'fbc59e8bc4b3e39bbdf75a824e3f1e3accd372bf1fda194ec433443feff88158a0df14cac0f3a1a3aef18ada98c3b02b40b5b254d1096ae28e3a84aace8b842f')
sha512sums_x86_64=('fcd4220be6765689097754d9dede1566e8ad22cf78ac2918511151ece529b6df0b7bae6d04533bd8023db7b31a85562ef46d1ccb9ab80ce2215734fd5a348f5b')
sha512sums_i686=('5e1ffe0d4cabdacdd0bf0a277ae226818270a209a20787fb24d42387d9caec06611399df320d7cce95d29d0fdfe1b3914cee08f1182a27bfcb0b34fe14f8abe4')

package() {
    install -d ${pkgdir}{/usr/share/applications,/usr/{bin,share/${pkgname}/}}
    
    if [ $CARCH == "x86_64" ]
    then
        cp -r ${srcdir}/Kaku-${pkgver}/* ${pkgdir}/usr/share/${pkgname}
    else
        cp -r ${srcdir}/Kaku-${pkgver}-ia32/* ${pkgdir}/usr/share/${pkgname}
    fi
    sed -i "s|Icon=/usr/share/kaku/logo.png|Icon=/usr/share/${pkgname}/logo.png|g" ${pkgdir}/usr/share/${pkgname}/misc/linux/*.desktop
    
    install -Dm644 ${srcdir}/logo.png ${pkgdir}/usr/share/${pkgname}/
    install -Dm644 ${pkgdir}/usr/share/${pkgname}/misc/linux/kaku.desktop ${pkgdir}/usr/share/applications/
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    
    chgrp -R audio ${pkgdir}/usr/share/${pkgname}
    chmod -R 775 ${pkgdir}/usr/share/${pkgname}
    
    ln -s /usr/share/${pkgname}/kaku ${pkgdir}/usr/bin/${_pkg_short_name}
}
