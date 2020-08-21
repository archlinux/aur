# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=codelobster
pkgver=1.9.0
pkgrel=1
pkgdesc='Free cross-platform IDE for PHP/HTML/CSS/JavaScript development'
arch=('x86_64')
url="http://www.codelobster.com"
license=("custom:${pkgname}")
provides=('codelobster-ide')
options=('!strip')
depends=('rtmpdump'
         'libxcomposite'
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
sha256sums=('6f52b8249dcb57f1e6ac0a2d7537031fdcc188c6dd0e7ba7807fdc2c9cda47aa'
            'SKIP')

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