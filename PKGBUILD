# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=codelobster
pkgver=1.10.2
pkgrel=1
pkgdesc='Free cross-platform IDE for PHP/HTML/CSS/JavaScript development'
arch=('x86_64')
url="http://www.codelobster.com"
license=("custom:${pkgname}")
provides=('codelobster-ide')
options=('!strip')
depends=('libxcomposite'
         'qt5-svg'
         'hicolor-icon-theme'
         'libxrandr'
         'libssh'
         'openssl-1.0'
         'qt5-webchannel'
         'qt5-location'
         'nss'
         'qt5-multimedia'
         'libxcursor')
source=("${pkgname}-${pkgver}.rpm::http://codelobsteride.com/download/codelobsteride-${pkgver}-1.x86_64.rpm"
        'LICENSE')
sha256sums=('97b01ad923863b487fa4bf111c0cfa10c39c7fa4ce7c891a82ed3b0eb9de7908'
            '70ce1193a0036cff727f29e1c94bd3ddd61599993ba5d130491037b91158a73a')

package() {
 mv "${srcdir}/opt" "${pkgdir}"
 mv "${srcdir}/usr" "${pkgdir}"
 rm "${pkgdir}/usr/bin"/code*
 ln -s /opt/codelobsteride/CodeLobsterIDE "${pkgdir}/usr/bin/codelobster"
 install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
 sed -i '4s|IDE|\ IDE|' "${pkgdir}/usr/share/applications/codelobsteride.desktop"
 sed -i '7s|.*|Exec=codelobster|' "${pkgdir}/usr/share/applications/codelobsteride.desktop"
 sed -i "6s|.*|Comment=$pkgdesc|" "${pkgdir}/usr/share/applications/codelobsteride.desktop"
 find "${pkgdir}/opt/codelobsteride/" -type f -exec chmod o+r {} +
 find "${pkgdir}/usr/share/icons/hicolor/" -type f -exec chmod o+r {} +
}
# vim:set ts=2 sw=2 et:
