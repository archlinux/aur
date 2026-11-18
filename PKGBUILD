# Maintainer: Medvedinca <TODO: replace with your AUR account e-mail>
#
# Binary package (file dist/PKGBUILD-bin): installs prebuilt artifacts from
# GitHub Releases (built by .github/workflows/build.yml). pkgver and sha256
# checksums are substituted by .github/workflows/aur.yml (job bin-package)
# when a release is published.

_gitname='crabber'
_giturl="https://github.com/auf-gg/${_gitname}"

pkgname=crabber-bin
pkgver=0.9.7
pkgrel=1
pkgdesc='XMPP messenger built on GPUI (release binaries)'
arch=('x86_64' 'aarch64')
url="$_giturl"
license=('MIT')
depends=(
  'libxkbcommon'
  'wayland'
  'libx11'
  'libxcb'
  'fontconfig'
  'freetype2'
  'alsa-lib'
  'pipewire'
  'vulkan-icd-loader'
  'dbus'
  'noto-fonts-emoji'   # colour emoji
)
provides=('crabber')
conflicts=('crabber' 'crabber-git')

# Tarballs produced by build.yml: crabber-<version>-<arch>-linux.tar.gz
# containing the binary, .desktop file, icon and LICENSE.
source_x86_64=("${_giturl}/releases/download/v${pkgver}/crabber-${pkgver}-x86_64-linux.tar.gz")
sha256sums_x86_64=('5d30504df32fc0706766064d964d66879f8c1710fba81b3acb8bd9e5637f9a37')

source_aarch64=("${_giturl}/releases/download/v${pkgver}/crabber-${pkgver}-aarch64-linux.tar.gz")
sha256sums_aarch64=('077a142a33d5f2de6e40cd3c134b271d96913eac0cc7a7100e187b3346c54d8a')

package() {
  cd "crabber-${pkgver}-${CARCH}-linux"

  install -Dm755 crabber "${pkgdir}/usr/bin/crabber"
  install -Dm644 crabber.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/crabber.png"
  install -Dm644 crabber.desktop "${pkgdir}/usr/share/applications/crabber.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
