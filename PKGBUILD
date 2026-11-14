# Maintainer: Dimariqe <dimariqe at gmail dot com>
#
# Binary package (file dist/PKGBUILD-bin): installs prebuilt artifacts from
# GitHub Releases (built by .github/workflows/build.yml). pkgver and sha256
# checksums are substituted by .github/workflows/aur.yml (job bin-package)
# when a release is published.

_gitname='cratty'
_giturl="https://github.com/auf-gg/${_gitname}"

pkgname=cratty-bin
pkgver=0.3.5
pkgrel=1
pkgdesc='Native GPU-rendered SSH client with an encrypted host vault (release binaries)'
arch=('x86_64' 'aarch64')
url="$_giturl"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'libxkbcommon'
  'libxkbcommon-x11'
  'wayland'
  'libx11'
  'libxcb'
  'fontconfig'
  'freetype2'
  'vulkan-icd-loader'
)
optdepends=(
  'gnome-keyring: passwordless vault unlock via Secret Service'
  'kwallet: passwordless vault unlock via Secret Service'
)
provides=('cratty')
conflicts=('cratty' 'cratty-git')

# Tarballs produced by build.yml: cratty-<version>-<arch>-linux.tar.gz
# containing the binary, .desktop file, icons and LICENSE.
source_x86_64=("${_giturl}/releases/download/v${pkgver}/cratty-${pkgver}-x86_64-linux.tar.gz")
sha256sums_x86_64=('1875fba61a5fa18503794c4548b8646ad3f3c5724029510ab904c1624722aa36')

source_aarch64=("${_giturl}/releases/download/v${pkgver}/cratty-${pkgver}-aarch64-linux.tar.gz")
sha256sums_aarch64=('fa3d70d90661c5c99f6710fe6b8a34b02e34b13d55fe533494ff85d193990d46')

package() {
  cd "cratty-${pkgver}-${CARCH}-linux"

  install -Dm755 cratty "${pkgdir}/usr/bin/cratty"
  install -Dm644 cratty.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/cratty.png"
  install -Dm644 cratty.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cratty.svg"
  install -Dm644 cratty.desktop "${pkgdir}/usr/share/applications/cratty.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
