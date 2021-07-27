# Maintainer: Baptiste Augrain <daiyam@zokugun.org>.
# Inspired from the PKGBUILD for vscodium-bin.

pkgname=mrcode-bin
pkgver=1.58.2
pkgrel=1
pkgdesc="An IDE based on VSCode / VSCodium (binary release)"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/zokugun/MrCode.git'
license=('MIT')

depends=(
    'fontconfig'
    'libxtst'
    'gtk3'
    'cairo'
    'alsa-lib'
    'nss'
    'gcc-libs'
    'libnotify'
    'libxss'
    'glibc>=2.28-4'
    'libxkbfile'
)
optdepends=(
    'gvfs: For move to trash functionality'
    'libdbusmenu-glib: For KDE global menu'
)
provides=('mrcode')
conflicts=(
    'mrcode'
    'mrcode-git'
)
source=(
    'mrcode.desktop'
)
source_x86_64=(
    "https://github.com/zokugun/MrCode/releases/download/${pkgver}/MrCode-linux-x64-${pkgver}.tar.gz"
)
source_armv7h=(
    "https://github.com/zokugun/MrCode/releases/download/${pkgver}/MrCode-linux-armhf-${pkgver}.tar.gz"
)
source_aarch64=(
    "https://github.com/zokugun/MrCode/releases/download/${pkgver}/MrCode-linux-arm64-${pkgver}.tar.gz"
)
sha256sums=(
    '362ef9b395929a66442f60be0e238ac69afbbda07728e4121c352fdea236af92'
)
sha256sums_x86_64=(
    '70809fcea597c1fa05ea15382a90c27371dd3e8f54ca05678a0fbcee6b0afcbd'
)
sha256sums_aarch64=(
    'a881a8c108604cfa79b24d79e9742d4294e083a37fb346497c845e7cef7b12bb'
)
sha256sums_armv7h=(
    '75d592fd3057fbafd289eee7aec426f19d7ee73dea76cb359541fb11e124f275'
)

shopt -s extglob

package() {
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{mrcode,applications,pixmaps}
    install -d -m755 ${pkgdir}/usr/share/licenses/mrcode
    
    cp -r ${srcdir}/resources/app/LICENSE.txt ${pkgdir}/usr/share/licenses/mrcode
    cp -r ${srcdir}/!(mrcode.desktop|MrCode-*-${pkgver}.tar.gz) ${pkgdir}/usr/share/mrcode
    
    ln -s /usr/share/mrcode/bin/mrcode ${pkgdir}/usr/bin/mrcode
    install -D -m644 mrcode.desktop ${pkgdir}/usr/share/applications/mrcode.desktop
    install -D -m644 ${srcdir}/resources/app/resources/linux/code.png ${pkgdir}/usr/share/pixmaps/mrcode.png
}
