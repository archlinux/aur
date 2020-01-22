# Maintainer: Rowisi <Rowisi <at> nomail <dot> nomail>
# Contributor: Plague-doctor <plague <at>> privacyrequired <<dot>> com >
# Contributor: me at oguzkaganeren dot com dot tr

pkgname=vscodium-bin-multiarch
pkgver=1.41.1
pkgrel=4
pkgdesc="Binary releases of VS Code without MS branding/telemetry/licensing."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/VSCodium/vscodium"
license=('MIT')
depends=(
        fontconfig libxtst gtk3 python cairo alsa-lib nss gcc-libs libnotify libxss
        'glibc>=2.28-4'
        )
optdepends=(
        'gvfs: For move to trash functionality'
        'libdbusmenu-glib: For KDE global menu'
)
provides=('code')
conflicts=('code' 'vscodium-bin')
source=(vscodium-bin.desktop)
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x86_64.tar.gz::${url}/releases/download/${pkgver}/VSCodium-linux-x64-${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-aarch64.tar.gz::${url}/releases/download/${pkgver}/VSCodium-linux-arm64-${pkgver}.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-${pkgrel}-armv7h.tar.gz::${url}/releases/download/${pkgver}/VSCodium-linux-arm-${pkgver}.tar.gz")
sha256sums=('5504e93bd55f2bc068c29e4fa962c1eddc6e08edb39c3255319dd5ad998a1b86')
sha256sums_x86_64=('3d50cedad289730301ddbb6cc5f754753e3fc58b0c812da5390b2871c0639c58')
sha256sums_aarch64=('851cc32a8b71efd6dacb864c2dfb8216eef3880c8dd9ec6998d12dbb69566319')
sha256sums_armv7h=('b13f911314d9523e75d0a9f0ee84dbcbe7d883e26aab1811776cd6643da64585')

noextract=("${pkgname}-${pkgver}-${pkgrel}-${CARCH}.tar.gz")

prepare() {
    mkdir -p ${srcdir}/${pkgname}
    tar -xf ${srcdir}/${pkgname}-${pkgver}-${pkgrel}-${CARCH}.tar.gz -C ${srcdir}/${pkgname}
}

package() {
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{${pkgname},applications,pixmaps}
    cp -r ${srcdir}/${pkgname} ${pkgdir}/usr/share
    ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/code
    ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/codium
    ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/vscodium
    install -D -m644 vscodium-bin.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -D -m644 ${srcdir}/${pkgname}/resources/app/resources/linux/code.png \
            ${pkgdir}/usr/share/pixmaps/vscodium.png
}
