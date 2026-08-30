# Maintainer: dizziee <jjdizz1l@proton.me>
#
# Nuvio — desktop media player (AUR binary package).
# Installs the signed Arch package attached to the NuvioLinux-unofficial
# GitHub release — no compilation. The package is built from the upstream
# NuvioMedia/NuvioDesktop source release; only pkgrel is maintained by
# this repo (byte-by-byte upstream source).
#
# Bump on every release: pkgver/pkgrel, the source URLs, and sha256sums[0]
# (grab it from the release's SHA256SUMS.txt).

pkgname=nuvio-linux-bin
pkgver=0.1.21alpha
pkgrel=3
pkgdesc="Nuvio desktop media player — upstream source packaged for Arch Linux (binary)"
arch=('x86_64')
url="https://github.com/NuvioMedia/NuvioDesktop"
license=('GPL3')
depends=('mpv' 'webkit2gtk-4.1' 'gtk3' 'glibc' 'gcc-libs' 'libx11' 'libxcomposite' 'libxext' 'libxrender' 'libxi' 'libxtst')
install=nuvio-linux-bin.install
provides=('nuvio-linux')
conflicts=('nuvio-linux' 'nuvio-linux-git')
source=(
  "nuvio-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/JJDizz1L/NuvioLinux-unofficial/releases/download/v0.1.21-alpha-3/nuvio-linux-0.1.21alpha-3-x86_64.pkg.tar.zst"
  "nuvio-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.sig::https://github.com/JJDizz1L/NuvioLinux-unofficial/releases/download/v0.1.21-alpha-3/nuvio-linux-0.1.21alpha-3-x86_64.pkg.tar.zst.sig"
)
sha256sums=(
  '2c2fe4d2c22ac12a67e6a4306a7f5a3a94c8f466b18013e744e656d068521349'
  'SKIP'
)
validpgpkeys=('9201A54A09675CBEBAD08647EDDA55C8236D6C88')

# Repackage the pre-built package tree that makepkg auto-extracted into
# $srcdir (makepkg unpacks the .pkg.tar.zst source with bsdtar). Only the
# real package dirs are copied — the extraction's .PKGINFO/.MTREE/.INSTALL
# metadata dotfiles are NOT carried over. pacman sets root ownership at
# install time, so cp -a's build-user ownership is corrected on install.
package() {
  cp -a "${srcdir}/opt" "${pkgdir}/"
  cp -a "${srcdir}/usr" "${pkgdir}/"
}
