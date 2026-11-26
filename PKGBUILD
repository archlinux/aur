# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=face-unlock-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Face ID for Linux: the lock screen, sudo and admin prompts by face, on Plasma, GNOME, Hyprland and Niri (upstream binary)"
arch=('x86_64')
url="https://github.com/LoonixTools/face-unlock"
# The program is GPL, the two face networks are MIT (YuNet) and Apache-2.0
# (SFace). All texts are in the package.
license=('GPL-3.0-or-later' 'MIT' 'Apache-2.0')
# What the binaries load, plus what the face-unlock command runs. The window
# is drawn with Rune, which opens fontconfig, the Vulkan loader, wayland and
# libxkbcommon by name. vulkan-driver: the loader alone draws nothing.
depends=('gcc-libs' 'glibc' 'pam' 'polkit' 'systemd'
         'fontconfig' 'hicolor-icon-theme' 'libxkbcommon' 'vulkan-driver' 'vulkan-icd-loader'
         'wayland')
optdepends=('hyprpolkitagent: password windows on Hyprland and Niri')
provides=('face-unlock')
conflicts=('face-unlock' 'plasma-face-unlock')
install="${pkgname}.install"
options=('!debug')
# Upstream's release workflow builds this tarball on Arch: the make install
# tree of face-unlock, in one folder.
_tarball="face-unlock-${pkgver}-arch-${CARCH}.tar.zst"
source=("${_tarball}::${url}/releases/download/v${pkgver}/${_tarball}")
noextract=("${_tarball}")
sha256sums=('5fd76d26f3149bf24c577cf125b003506c58dc5715b8f9d5a2dec2c9bc90437b')

package() {
  # extracted here and not by makepkg, so the files keep the root owner
  # the tarball gives them
  bsdtar -xpf "$srcdir/${_tarball}" -C "$pkgdir" --strip-components 1
  mv "$pkgdir/usr/share/licenses/face-unlock" "$pkgdir/usr/share/licenses/$pkgname"
}
