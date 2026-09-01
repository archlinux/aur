# Maintainer: Jon Kinney
#
# Source of truth for the AUR `mousehop-bin` package — prebuilt
# binaries from the GitHub Release. aur-publish.yml copies this file,
# pins pkgver/pkgrel to the release, refreshes sha256sums with
# updpkgsums (which downloads both arch tarballs and computes per-arch
# sums), regenerates .SRCINFO, and pushes. Edit depends / package()
# etc. here — never in the AUR repo directly.
pkgname=mousehop-bin
_pkgname=mousehop
pkgver=0.16.0
pkgrel=1
pkgdesc='Software KVM Switch / mouse & keyboard sharing software for Local Area Networks (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/jondkinney/mousehop'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtk4' 'libx11' 'libxtst' 'glib2' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64.tar.gz")
# Placeholders — CI's updpkgsums overwrites with real hashes per release.
sha256sums_x86_64=('80fd9f059e3318ed20b42185921b436e5d7f41b0075f97b6d60b74412563a6a1')
sha256sums_aarch64=('40bc4dffb0b929ea5d1a10add791398126fa697ffbc3d1639c650b59de2ffaea')

package() {
  # The tarball top-level dir is mousehop-<ver>-<CARCH>; makepkg sets
  # $CARCH to the host arch so we pick the matching one without a case
  # statement.
  cd "$srcdir/$_pkgname-$pkgver-$CARCH"
  install -Dm755 mousehop "$pkgdir/usr/bin/mousehop"
  install -Dm644 com.mousehop.Mousehop.desktop \
    "$pkgdir/usr/share/applications/com.mousehop.Mousehop.desktop"
  install -Dm644 com.mousehop.Mousehop.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.mousehop.Mousehop.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
