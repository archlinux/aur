# Maintainer: itzlassejlv <hello@lassejlv.dk>
pkgname=arego
_version=0.1.42
pkgver=${_version//-/_}
pkgrel=1
pkgdesc="Design with HTML and CSS on a native canvas"
arch=('x86_64' 'aarch64')
url="https://arego.design"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'fontconfig' 'freetype2' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme' 'shared-mime-info' 'desktop-file-utils')
optdepends=('vulkan-driver: GPU rendering (mesa provides one)'
            'wl-clipboard: paste rich content on Wayland'
            'xclip: paste rich content on X11'
            'org.freedesktop.secrets: remember your key (gnome-keyring, kwallet, keepassxc)')
options=('!strip' '!debug')
source_x86_64=("Arego-$_version-linux-x86_64.tar.gz::https://releases.arego.design/v$_version/Arego-$_version-linux-x86_64.tar.gz")
sha256sums_x86_64=('d0b4ee9a0a8b5498bb97d96b52367276aeb5430e115baf595e8125c5ca039aa5')
source_aarch64=("Arego-$_version-linux-arm64.tar.gz::https://releases.arego.design/v$_version/Arego-$_version-linux-arm64.tar.gz")
sha256sums_aarch64=('4051e4330c866530573b82492d0bf16c6d6cd4cb9ee406aee6490fc38696f982')

package() {
    case "$CARCH" in
        aarch64) cd "Arego-$_version-linux-arm64" ;;
        *) cd "Arego-$_version-linux-$CARCH" ;;
    esac
    install -Dm755 bin/arego "$pkgdir/usr/bin/arego"
    cp -r share "$pkgdir/usr/"
    find "$pkgdir/usr/share" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share" -type f -exec chmod 644 {} +
}
