# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=face-unlock-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Face ID for Linux: the lock screen, sudo and admin prompts by face, on Plasma, GNOME, Hyprland and Niri (upstream binary)"
arch=('x86_64')
url="https://github.com/LoonixTools/face-unlock"
# The program is GPL, the two face networks are MIT (YuNet) and Apache-2.0
# (SFace). The daemon has OpenCV (Apache-2.0) linked in, with its copies of
# protobuf, libjpeg-turbo, libpng and zlib. All texts are in the package.
license=('GPL-3.0-or-later' 'MIT' 'Apache-2.0' 'BSD-3-Clause' 'IJG' 'Zlib' 'libpng-2.0')
# What the binaries load, plus what the face-unlock command runs. No opencv:
# it is linked in.
depends=('bash' 'coreutils' 'gawk' 'grep' 'sed' 'gettext' 'systemd' 'systemd-libs' 'pam' 'polkit'
         'qt6-base' 'qt6-declarative' 'qt6-wayland' 'wayland' 'layer-shell-qt' 'ki18n'
         'glibc' 'libgcc' 'libstdc++' 'hicolor-icon-theme')
optdepends=('hyprpolkitagent: password windows on Hyprland and Niri')
provides=('face-unlock')
conflicts=('face-unlock' 'plasma-face-unlock')
install="${pkgname}.install"
options=('!debug')
# Upstream's release workflow builds this tarball on Arch: the make install
# tree of face-unlock, in one folder. The agent uses Qt's private API, so it
# fits the Qt that Arch had at the release.
_tarball="face-unlock-${pkgver}-arch-${CARCH}.tar.zst"
source=("${_tarball}::${url}/releases/download/v${pkgver}/${_tarball}")
noextract=("${_tarball}")
sha256sums=('b3b48a2c40650cc00ecbde713b86275fe8aef4885ba005c1de6d040974555393')

package() {
  # extracted here and not by makepkg, so the files keep the root owner
  # the tarball gives them
  bsdtar -xpf "$srcdir/${_tarball}" -C "$pkgdir" --strip-components 1
  mv "$pkgdir/usr/share/licenses/face-unlock" "$pkgdir/usr/share/licenses/$pkgname"
}
