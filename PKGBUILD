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
pkgver=0.1.17alpha
pkgrel=3
pkgdesc="Nuvio Linux desktop media player — Linux native mpv playback (binary)"
arch=('x86_64')
url="https://github.com/JJDizz1L/NuvioLinux"
license=('custom:commercial')
depends=('mpv' 'glibc' 'gcc-libs' 'libstdc++' 'libx11' 'libxext' 'libxrender' 'libxi' 'libxtst')
install=nuvio-linux-bin.install
provides=('nuvio-linux')
conflicts=('nuvio-linux' 'nuvio-linux-git')
source=(
  "nuvio-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/JJDizz1L/NuvioLinux/releases/download/v0.1.17-alpha-3/nuvio-linux-0.1.17alpha-3-x86_64.pkg.tar.zst"
  "nuvio-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.sig::https://github.com/JJDizz1L/NuvioLinux/releases/download/v0.1.17-alpha-3/nuvio-linux-0.1.17alpha-3-x86_64.pkg.tar.zst.sig"
)
sha256sums=(
  '15aaadd54be348f3fdb9ee99a918d5f621db09c06c115e71b59f4f941be42b32'
  'SKIP'
)
validpgpkeys=('54B66A801C9B0D3D471E01376702DBAB3E41EDE1')

package() {
  # Extract only the payload (opt/, usr/); skip the source package's own
  # metadata dotfiles (.PKGINFO/.BUILDINFO/.MTREE/.INSTALL), which makepkg
  # rejects as dotfiles in the package root.
  tar -xf "${srcdir}/nuvio-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" opt usr
}
