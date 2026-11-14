# Maintainer: Medvedinca <TODO: replace with your AUR account e-mail>
#
# Binary package (file dist/PKGBUILD-bin): installs prebuilt artifacts from
# GitHub Releases (built by .github/workflows/build.yml). pkgver and sha256
# checksums are substituted by .github/workflows/aur.yml (job bin-package)
# when a release is published.

_gitname='crabber'
_giturl="https://github.com/auf-gg/${_gitname}"

pkgname=crabber-bin
pkgver=0.9.3
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
sha256sums_x86_64=('dffcfd1f7561b05fa2788063e729af84f4ad9b21782fccdabc87840c771a6a01')

source_aarch64=("${_giturl}/releases/download/v${pkgver}/crabber-${pkgver}-aarch64-linux.tar.gz")
sha256sums_aarch64=('f67554e7b28c7a6cae998a88302b7c7ac07ff82f9c8d598cb6b7e542b9bb2c52')

package() {
  cd "crabber-${pkgver}-${CARCH}-linux"

  install -Dm755 crabber "${pkgdir}/usr/bin/crabber"
  install -Dm644 crabber.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/crabber.png"
  install -Dm644 crabber.desktop "${pkgdir}/usr/share/applications/crabber.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
