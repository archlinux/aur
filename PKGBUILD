# Maintainer: Baptiste Augrain <daiyam@zokugun.org>.
# Inspired from the PKGBUILD for vscodium-bin.

pkgname=mrcode-bin
pkgver=1.79.0.23164
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
sha256sums_x86_64=('53d8484729223b0404178f66c125bbf65f965ea35d9c03a59970f2609e955728')
sha256sums_aarch64=('2536e6db1256477a72a0d2c0aef5bf9fe1297cd9f2c16b507bca2ddb2c0965c5')
sha256sums_armv7h=('4380d5c5645209ac48ff1e463a3fe06ce99116d3da6a67cfcb85ee11bee810c3')

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
