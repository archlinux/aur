# Maintainer: itzlassejlv <hello@lassejlv.dk>
pkgname=arego
_version=0.1.39
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
sha256sums_x86_64=('6b298a4d2b5b85eea5f4694879a6c2290dde4fb25b3d792a3db52713789afd38')
source_aarch64=("Arego-$_version-linux-arm64.tar.gz::https://releases.arego.design/v$_version/Arego-$_version-linux-arm64.tar.gz")
sha256sums_aarch64=('77d03d94506628c2afaf25568c781dea10c4e4762aeb41d0faa2cf7afcfb0985')

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
