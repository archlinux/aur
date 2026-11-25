# Maintainer: Evilchuck666 <carlos.martinez.medina1992@gmail.com>
#
# Repackages the single-file Linux build attached to each GitHub release: a PyInstaller
# executable with its own Python 3.13 and Qt, as tested by CI. The release workflow copies
# this file to the AUR with pkgrel=1 and fills in the checksums with updpkgsums.
pkgname=quakedock-bin
_pkgname=QuakeDock
pkgver=1.3.0
pkgrel=1
pkgdesc="Desktop installer and launcher for Quake (vkQuake campaign, ezQuake + nQuake multiplayer)"
arch=('x86_64')
url="https://github.com/Evilchuck666/QuakeDock"
license=('GPL-3.0-only')
# glibc of the Ubuntu 24.04 build machine; Qt's xcb and wayland platform libraries;
# SteamCMD is a 32-bit program; vkQuake and ezQuake are downloaded as AppImages.
depends=('glibc>=2.39' 'gcc-libs' 'zlib' 'fontconfig' 'freetype2' 'libglvnd'
         'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'xcb-util-cursor'
         'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm'
         'wayland' 'dbus' 'hicolor-icon-theme' 'lib32-gcc-libs' 'fuse2')
optdepends=('vulkan-icd-loader: Vulkan renderer for vkQuake')
provides=("quakedock=$pkgver")
conflicts=('quakedock')
# Stripping would break the executable: PyInstaller appends its archive to it.
options=('!strip' '!debug')
source=("$_pkgname-$pkgver-linux-x64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x64.tar.gz"
        "quakedock-$pkgver.svg::https://raw.githubusercontent.com/Evilchuck666/$_pkgname/v$pkgver/assets/icons/vkQuake.svg"
        'quakedock.desktop')
sha256sums=('7dd8b546130324f8b0018888fb560dd501ac5764a793c7365312ced4a6c2edf2'
            'a374ea0f8604905816fb7e219f60e53b0194c757c98150012d272e0bcf97c1be'
            '28226e09d2a45310941319c3208acbf0ab266cbb743b83fc5e4da7a265cebd44')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/quakedock"
    install -Dm644 "$srcdir/quakedock.desktop" "$pkgdir/usr/share/applications/quakedock.desktop"
    install -Dm644 "$srcdir/quakedock-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/quakedock.svg"
}
