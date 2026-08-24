# Maintainer: calmcrow <calmcrow@outlook.com>
#
# ============================================================
#  winghexexplorer2-bin — Third-party repackaging
# ============================================================
#  This is a third-party maintained binary package. Source and
#  build process are fully open:
#  - Source repo: https://github.com/calmcrow/winghexexplorer2-bin
#  - Build: GitHub Actions pulls the author's official PKGBUILD
#           (https://aur.archlinux.org/winghexexplorer2.git) daily,
#           builds inside an Arch Linux container, and uploads the
#           artifact to this repo's Releases; this -bin package
#           downloads and installs it directly.
#  - Upstream: https://github.com/Wing-summer/WingHexExplorer2
#
#  A confirmation notice is shown on install; make sure you trust
#  this third-party packaging before using it.

pkgname=winghexexplorer2-bin
pkgver=2.3.8
pkgrel=1
pkgdesc='A free, powerful, cross-platform hex editor (pre-built binary, third-party packaging)'
url='https://github.com/Wing-summer/WingHexExplorer2'
arch=('x86_64')
license=('AGPL-3.0-only')
depends=('qt6-base' 'xdg-utils' 'shared-mime-info' 'desktop-file-utils' 'gtk-update-icon-cache')
conflicts=('winghexexplorer2' 'winghexexplorer2-git')
provides=('winghexexplorer2')
options=('!strip')
install=winghexexplorer2-bin.install

_ghrepo='calmcrow/winghexexplorer2-bin'

_pkgbase=winghexexplorer2
_asset="$_pkgbase-$pkgver-$pkgrel-$CARCH.pkg.tar.zst"

source=("$_asset::https://github.com/$_ghrepo/releases/download/v$pkgver/$_asset")
noextract=("$_asset")
# sha256 is written automatically by CI (build.yml) after building;
# the placeholder below is only for the initial commit and will be
# replaced on the first workflow run.
sha256sums=('f58b1b508bfd3d8b8c3347038ec2c80a18040532b949baf0441d51a0ead7d001')

package() {
  bsdtar --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.BUILDINFO' --exclude='.INSTALL' \
    -xf "$srcdir/$_asset" -C "$pkgdir"
}
