# Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=vscodium-bin
pkgver=1.33.1
pkgrel=2
pkgdesc="Binary releases of VS Code without MS branding/telemetry/licensing."
arch=('x86_64')
url="https://github.com/VSCodium/vscodium"
license=('MIT')
depends=(
        fontconfig libxtst gtk3 python cairo alsa-lib nss gcc-libs libnotify libxss gconf
        'glibc>=2.28-4'
        )
optdepends=(
        'gvfs: For move to trash functionality'
        'libdbusmenu-glib: For KDE global menu'
)
provides=('code')
source=(
        vscodium-bin.desktop
        ${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/releases/download/${pkgver}/VSCodium-linux-x64-${pkgver}.tar.gz
       )
noextract=("${pkgname}-${pkgver}-${pkgrel}.tar.gz")
sha256sums=('44c07450999d260672edfd34215fde0ca11829a38f89592f4d1f035e1dd5012a'
            'ff90d3541627e380afc7026c0ec9b451510a9440e457c951c8a3e3261aefb017')

prepare() {
    mkdir -p ${srcdir}/${pkgname}
    tar -xf ${srcdir}/${pkgname}-${pkgver}-${pkgrel}.tar.gz -C ${srcdir}/${pkgname}
}

package() {
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{${pkgname},applications,pixmaps}
    cp -r ${srcdir}/${pkgname} ${pkgdir}/usr/share
    ln -s /usr/share/${pkgname}/bin/vscodium ${pkgdir}/usr/bin/vscodium
    install -D -m644 vscodium-bin.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -D -m644 ${srcdir}/${pkgname}/resources/app/resources/linux/code.png \
            ${pkgdir}/usr/share/pixmaps/vscodium.png
}
