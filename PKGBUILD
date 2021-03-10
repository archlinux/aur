# Maintainer: JoseDR120 <josedrgerena720@gmail.com>
# Use the download link from github is faster.
# https://github.com/atom/atom/releases/download/v{pkgver}/atom-amd64.deb
 
pkgname=atom-editor-bin
pkgver=1.55.0
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
source=("atom-amd64-v${pkgver}.deb::https://github.com/atom/atom/releases/download/v${pkgver}/atom-amd64.deb"
         "LICENSE::https://raw.githubusercontent.com/atom/atom/v${pkgver}/LICENSE.md"
         atom-editor-bin.install
         startupwmclass.patch)
sha512sums=('911022d1db276a495d341984471b09fc5d13bc2cb69de16179f209ad3c30afa6107fb8617f7933dbfacb88af564198bbc751fdae912cf867a591c096fcccb460'
            'c8fdd1d51313c078d20ab4c127db78d71d94e1987b78ce04fb1b6b47e875b047c5722092892ac0b6ec6640c7428b4e03a22f71f29d9d67082cd22cadf604b7fc'
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
