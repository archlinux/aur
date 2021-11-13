# Maintainer: Baptiste Augrain <daiyam@zokugun.org>.
# Inspired from the PKGBUILD for vscodium-bin.

pkgname=mrcode-bin
pkgver=1.62.2+21317
pkgrel=1
pkgdesc="A custom build of VSCodium / VSCode (binary release)"
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
sha256sums=('362ef9b395929a66442f60be0e238ac69afbbda07728e4121c352fdea236af92')
sha256sums_x86_64=('d3d7b9a3b6123361012c80d975933f55f496b40de75b368e9c55c62d6d3fda3f')
sha256sums_aarch64=('6aeda861f6a222ff726d1235d7b5f0fc38228f3615b5deaec69e4ebecba43658')
sha256sums_armv7h=('fdc3e028ad55b28957a4c25603a8712f53a81e767dea0277866a9e8ef601c08f')

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
