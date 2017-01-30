# Maintainer: yk <yk at archlinuxcn dot org>

_pkgname=desktop-app
pkgname=leanote
pkgver=2.3
pkgrel=1
pkgdesc="Knowledge, Blog, Sharing, Cooperation."
arch=("i686" "x86_64")
url="https://leanote.com/"
license=("GPL3")
depends=("electron" "gconf")
makedepends=("electron" "gulp")
provides=("${pkgname}")
conflicts=("${pkgname}")
#install=$pkgname.install

source=("leanote.desktop"
"leanote"
)
sha256sums=('8dab30fe0835432e44b5a3a1d46aebde8716a2a47ba4031cbe2a01560987aa83'
'57155a0e423bc98f0e83acb35f03ace06b3de54bdc64b2373128671c801727b1'
)

source_x86_64=("https://sourceforge.net/projects/leanote-desktop-app/files/${pkgver}/leanote-desktop-linux-x64-v${pkgver}.zip/download")
source_i686=("https://sourceforge.net/projects/leanote-desktop-app/files/${pkgver}/leanote-desktop-linux-ia32-v${pkgver}.zip/download")
sha256sums_x86_64=('2d83504ed1537ff5263dda3056c2c57513e941ca0fb7900823c9c4a137f39983')
sha256sums_i686=('f65a0c58f6ac77f71c522647f9acffee8790c466d3c5bb8246daceee2c657b51')

build() {
	cd "${srcdir}"
    rm -rf __MACOSX 
    rm -rf .DS_Store
}

package() {
    install -d "${pkgdir}"/opt
    install -D -m655 "./${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "./${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${srcdir}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

    rm -rf "${srcdir}/LICENSE"
    rm -rf "${srcdir}/LICENSE.chromium.html"
    rm -rf "${srcdir}/${pkgname}.png"

    cp -R ${srcdir}/ "${pkgdir}/opt/leanote"
}
