# Maintainer: Posi <posi1981@gmail.com>
 
pkgname=atom-editor-bin
pkgver=1.58.0
pkgrel=1
pkgdesc="Hackable text editor built on Electron (official precompiled binary)"
arch=('x86_64')
url="https://github.com/atom/atom"
license=('MIT')
provides=('atom' 'apm')
options=(!strip !emptydirs)
depends=('git' 'gtk3' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'desktop-file-utils' 'alsa-lib' 'libgnome-keyring' 'libxss' 'libxkbfile' 'ripgrep')
optdepends=('gvfs')
conflicts=('atom' 'atom-editor' 'atom-editor-git' 'atom-editor-git-tagged' 'apm' 'atom-notracking')
install=$pkgname.install
source=("atom-amd64-v${pkgver}.deb::https://atom-installer.github.com/v${pkgver}/atom-amd64.deb"
         "LICENSE::https://raw.githubusercontent.com/atom/atom/v${pkgver}/LICENSE.md"
         atom-editor-bin.install
         startupwmclass.patch)
sha512sums=('cc71c3457584df13d1479f36b2015ebf311c48e478b24fcdb1660a967287a44da2a6d9b009537aeaba1a55781ace09922ce9022e666d32d08bfcf536cee3e32d'
            'aa2bfd5acaf642bbdb7290ac8b7ddeaf0b84ae8b12e6d893bb6adec799ea9141ff0f606526932568f15104ef2129f152ef19882949c1c2d27aed1ed19ffde185'
            'e30f7e4812898b80c079ba419e0cb37522c2e154ef7fdd6dda3da06dcbcaadc42016dd3d3b8caf206b842a2b9e3b954e537626d72337c56f05365a733627ce6c'
            '374b9f8fa1e0d2cab77d4cea9c718fb889bb6db3dbf9762ad5cbb88f3a0936023f36641012fc90e029832a772b8d4fdfe6b72f304e3950c02a7c9bf4d6d3d4ec')
 
prepare() {
  # Extract data
  bsdtar xf data.tar.xz
 
  # Apply patches
  patch -sp1 < "${srcdir}"/startupwmclass.patch
}
 
package() {
  # Recursively remove group's write permission before moving to package directory
  chmod -R g-w usr
  mv usr "${pkgdir}"
 
  # Add LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
