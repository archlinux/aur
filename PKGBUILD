# Maintainer: Christopher Kobayashi <software+aur@disavowed.jp>

pkgname=eagle6
pkgver=6.6.0
pkgrel=2
pkgdesc="CadSoft EAGLE 6.x"
provides=("${pkgname}")
conflicts=()
arch=('i686' 'x86_64')
url='http://eagle.autodesk.com/eagle/software-versions/10'
license=('Proprietary')
depends=(
	'libjpeg6-turbo'
	'lib32-libjpeg6-turbo'
	'lib32-openssl-1.0'
)
makedepends=()
source=('http://eagle.autodesk.com/eagle/download-software/54'
        'eagle6.desktop'
)
sha256sums=('1dd8f59a4c6b3a741e4c5e7eaa88347b9c12be8076c7cbb3580541a55a42a254'
        'SKIP'
)

package() {
    mv 54 eagle-lin.run
    chmod +x eagle-lin.run
    ./eagle-lin.run "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/eagle-${pkgver}/bin/eagle" "${pkgdir}/usr/bin/eagle-${pkgver}"

    # provide desktop integration
    install -Dm644 "$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgdir/opt/eagle-$pkgver/bin/eagleicon50.png" \
        "$pkgdir/usr/share/pixmaps/eagle.png"
}
