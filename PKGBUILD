# Maintainer: Marcus Rosado <marcusbanditten@gmail.com>
# The AUR's anibeam-bin: the release build from GitHub, nothing compiled. CI builds the binary
# in an Arch container against Arch's Qt, MpvQt and libmpv (arch.yml) and packs it with
# apps/linux/packaging/aur/bin-tarball.sh, so it installs the same files as anibeam. Publish it
# with apps/linux/packaging/aur/publish.sh after the release is on GitHub.
pkgname=anibeam-bin
_pkgname=anibeam
pkgver=2.4.0
pkgrel=1
pkgdesc="Browse, play and track a local anime library (Qt 6 and libmpv), prebuilt"
arch=(x86_64)
url="https://github.com/marcusbandit/AniBeam"
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
source=("AniBeam-$pkgver-linux-x86_64.tar.zst::$url/releases/download/v$pkgver/AniBeam-$pkgver-linux-x86_64.tar.zst")
noextract=("AniBeam-$pkgver-linux-x86_64.tar.zst")
sha256sums=('bcb1cb3aeb5c5b9b59fb5db1f657bc518863f036c4420c22e7933108cda4210d')

package() {
  bsdtar -xf "$srcdir/AniBeam-$pkgver-linux-x86_64.tar.zst" -C "$pkgdir"
}
