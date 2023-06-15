# Maintainer: Baptiste Augrain <daiyam@zokugun.org>.
# Inspired from the PKGBUILD for vscodium-bin.

pkgname=mrcode-bin
pkgver=1.79.2.23166
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
    "https://github.com/zokugun/MrCode/releases/download/${pkgver}/MrCode-linux-x64-${pkgver/+/.}.tar.gz"
)
source_armv7h=(
    "https://github.com/zokugun/MrCode/releases/download/${pkgver}/MrCode-linux-armhf-${pkgver/+/.}.tar.gz"
)
source_aarch64=(
    "https://github.com/zokugun/MrCode/releases/download/${pkgver}/MrCode-linux-arm64-${pkgver/+/.}.tar.gz"
)
sha256sums=('362ef9b395929a66442f60be0e238ac69afbbda07728e4121c352fdea236af92')
sha256sums_x86_64=('de252cb38b438c841b61681a6c9d1552b8a2d75eb102c81d474fb78342bc8065')
sha256sums_aarch64=('efffb27b4e30f7609d2a0eb5cc96a3119e6710f24ca176d41fb85ff6811c7b81')
sha256sums_armv7h=('43b6c0610bf026933fc84f8c535e7a8fef467aaa87cc54d049c19e5d678e8350')

shopt -s extglob

package() {
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{mrcode,applications,pixmaps}
    install -d -m755 ${pkgdir}/usr/share/licenses/mrcode
    
    cp -r ${srcdir}/resources/app/LICENSE.txt ${pkgdir}/usr/share/licenses/mrcode
    cp -r ${srcdir}/!(mrcode.desktop|MrCode-*-${pkgver/+/.}.tar.gz) ${pkgdir}/usr/share/mrcode
    
    ln -s /usr/share/mrcode/bin/mrcode ${pkgdir}/usr/bin/mrcode
    install -D -m644 mrcode.desktop ${pkgdir}/usr/share/applications/mrcode.desktop
    install -D -m644 ${srcdir}/resources/app/resources/linux/code.png ${pkgdir}/usr/share/pixmaps/mrcode.png
}
