# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-cpma
pkgver=1.53
pkgrel=1
pkgdesc="Challenge ProMode Arena (CPMA) is a Quake3 modification which adds features aimed towards professional gamers and competitive enviroments."
url="http://playmorepromode.org/"
license=('custom')
arch=('any')
depends=('quake3')
source=('quake3-cpma.launcher' "https://cdn.playmorepromode.com/files/cpma/cpma-${pkgver}-nomaps.zip"
'https://cdn.playmorepromode.com/files/cpma-mappack-full.zip')
sha256sums=('436f0545efc0edaaf5aad884dfe103e13363f25be276471b6c57c8932575e245'
            'edfffa0c1a0375ba46a5b42257a168fb15086712245733526ab2d9ccdd821ca0'
            '5db933fc92c41f2e0941ab65725586d4d0c30fe84727427bb6b265e4d941a226')
PKGEXT='.pkg.tar'

package() {
    # Create destination directories
    install -d "${pkgdir}/opt/quake3/baseq3/"

    # Install CPMA Files
    mv "${srcdir}/cpma" "${pkgdir}/opt/quake3/"

    # Install CPMA Maps in baseq3 so maps can be loaded in other mods
    install -m 644 "${srcdir}"/*.pk3 \
        "${pkgdir}/opt/quake3/baseq3"

    # Install Launcher
    install -D -m 755 "${srcdir}/quake3-cpma.launcher" \
        "${pkgdir}/usr/bin/quake3-cpma"
}
