# Maintainer: Marcus Rosado <22052802+marcusbandit@users.noreply.github.com>
# The AUR's anibeam-bin: the release build from GitHub, nothing compiled. CI builds the binary
# in an Arch container against Arch's Qt, MpvQt and libmpv (arch.yml) and packs it with
# apps/linux/packaging/aur/bin-tarball.sh, so it installs the same files as anibeam. Publish it
# with apps/linux/packaging/aur/publish.sh after the release is on GitHub.
pkgname=anibeam-bin
_pkgname=anibeam
pkgver=2.5.0
pkgrel=1
pkgdesc="Browse, play and track a local anime library (Qt 6 and libmpv), prebuilt"
arch=(x86_64)
url="https://github.com/marcusbandit/Anibeam"
license=(GPL-3.0-or-later)
# The same runtime as anibeam: anirss and qbittorrent-nox are the Downloads page's.
depends=(qt6-base qt6-declarative qt6-svg mpvqt mpv gcc-libs glibc hicolor-icon-theme
         'anirss>=0.6.0' qbittorrent-nox)
optdepends=(
  'org.freedesktop.secrets: tracker sign-ins kept in the keyring rather than a file'
)
# The tarball's binary is stripped already, so there is nothing to strip or split off.
options=(!strip !debug)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("Anibeam-$pkgver-linux-x86_64.tar.zst::$url/releases/download/v$pkgver/Anibeam-$pkgver-linux-x86_64.tar.zst")
noextract=("Anibeam-$pkgver-linux-x86_64.tar.zst")
sha256sums=('537b59f5a699c5ce2fb2e2ce7352652ccbaafe3f22a0dd5b1faad3fff0b3cdad')

package() {
  bsdtar -xf "$srcdir/Anibeam-$pkgver-linux-x86_64.tar.zst" -C "$pkgdir"
}
