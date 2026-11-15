# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=waypointer-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A tiny hand on a stick that points at things on your screen (upstream binary)"
arch=('x86_64')
url="https://github.com/Felitendo/waypointer"
license=('MIT')
# What the binary links, plus what it opens at run time: fontconfig, wayland
# and the Vulkan loader. vulkan-driver: the loader alone draws nothing.
depends=('alsa-lib' 'fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbcommon'
         'vulkan-driver' 'vulkan-icd-loader' 'wayland')
optdepends=('kwin: shortcuts, Alt and Shift, and panels that stay usable on KDE Plasma'
            'xdg-desktop-portal: picking the picture for your own hand')
provides=('waypointer')
conflicts=('waypointer')
options=('!debug')
# Upstream's release workflow builds this tarball on Arch: the make install
# tree of waypointer, in one folder.
_tarball="waypointer-${pkgver}-arch-${CARCH}.tar.zst"
source=("${_tarball}::${url}/releases/download/v${pkgver}/${_tarball}")
noextract=("${_tarball}")
sha256sums=('9b9355b8e7fc3688a24a047f80867b7b0a3ea0501a05fd1ee8a5a19cb5e41b99')

package() {
  # extracted here and not by makepkg, so the files keep the root owner
  # the tarball gives them
  bsdtar -xpf "$srcdir/${_tarball}" -C "$pkgdir" --strip-components 1
  mv "$pkgdir/usr/share/licenses/waypointer" "$pkgdir/usr/share/licenses/$pkgname"
}
