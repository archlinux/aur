# Maintainer: OyNIx <https://github.com/trail-b1az3r/OyNIx>
#
# AUR package: repackages the prebuilt release from GitHub (the same files as
# the release's oynix-*.pkg.tar.zst, which carries its own Qt runtime under
# /usr/lib/oynix). .github/workflows/aur.yml fills in pkgver and the checksum
# and pushes this file to aur.archlinux.org on every release.

pkgname=oynix-bin
pkgver=5.5.0
pkgrel=1
pkgdesc="Fast, private web browser (Rust + QML, Qt 6.12) with Chrome/Firefox extension support (prebuilt)"
arch=('x86_64')
url="https://github.com/trail-b1az3r/OyNIx"
license=('MIT')
depends=(glibc gcc-libs libglvnd vulkan-icd-loader libxkbcommon libxkbcommon-x11 xcb-util-cursor
         xcb-util-wm xcb-util-keysyms xcb-util-image xcb-util-renderutil nss libxcomposite
         libxdamage libxrandr libxtst fontconfig dbus alsa-lib)
optdepends=('vulkan-radeon: Vulkan on AMD'
            'vulkan-intel: Vulkan on Intel'
            'nvidia-utils: Vulkan on NVIDIA')
provides=('oynix')
conflicts=('oynix')
options=(!strip !debug)
noextract=("oynix-${pkgver}-1-x86_64.pkg.tar.zst")
source=("oynix-${pkgver}-1-x86_64.pkg.tar.zst::${url}/releases/download/v${pkgver}/oynix-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('b606944b77bdee989895a3d5d51b46d222b939fe4c3e9b995d737c1c53d42d5b')

package() {
  bsdtar -xf "oynix-${pkgver}-1-x86_64.pkg.tar.zst" -C "$pkgdir" --exclude '.PKGINFO' --exclude '.BUILDINFO' --exclude '.MTREE' --exclude '.INSTALL'
}
