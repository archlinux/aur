# Maintainer: dizziee <jjdizz1l@gmail.com>
#
# Nuvio Linux — Linux-native mpv desktop media player (AUR binary package).
#
# Installs the prebuilt Arch package attached to the GitHub release — no
# compilation. Pair with `nuvio-linux-git` (source) and the release-pinned
# stable package.
#
# Bump on every release: update pkgver/pkgrel, the source URL, and the sha256
# (grab it from the release's SHA256SUMS.txt).

pkgname=nuvio-linux-bin
pkgver=0.1.20alpha
pkgrel=2
pkgdesc="Nuvio Linux desktop media player — Linux native mpv playback (binary)"
arch=('x86_64')
url="https://github.com/JJDizz1L/NuvioLinux"
license=('custom:commercial')
depends=('mpv' 'glibc' 'gcc-libs' 'libstdc++' 'libx11' 'libxext' 'libxrender' 'libxi' 'libxtst')
install=nuvio-linux-bin.install
provides=('nuvio-linux')
conflicts=('nuvio-linux' 'nuvio-linux-git')
source=(
  "nuvio-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/JJDizz1L/NuvioLinux/releases/download/v0.1.20-alpha-2/nuvio-linux-0.1.20alpha-2-x86_64.pkg.tar.zst"
  "nuvio-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.sig::https://github.com/JJDizz1L/NuvioLinux/releases/download/v0.1.20-alpha-2/nuvio-linux-0.1.20alpha-2-x86_64.pkg.tar.zst.sig"
)
sha256sums=(
  '6cea0e96bead76924bf2269e7db030d7353f943394b95a665cc4c0f612e124dc'
  'SKIP'
)
validpgpkeys=('54B66A801C9B0D3D471E01376702DBAB3E41EDE1')

package() {
  # Extract only the payload (opt/, usr/); skip the source package's own
  # metadata dotfiles (.PKGINFO/.BUILDINFO/.MTREE/.INSTALL), which makepkg
  # rejects as dotfiles in the package root.
  tar -xf "${srcdir}/nuvio-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" opt usr
}
