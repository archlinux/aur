# Maintainer: AuthenticSm1les <https://aur.archlinux.org/account/smiley>
pkgname=sing-box-dashboard
pkgver=2026.09.18
pkgrel=1
pkgdesc="Web dashboard for sing-box (official SagerNet build)"
arch=('any')
url="https://github.com/SagerNet/sing-box-dashboard"
license=('GPL3')
optdepends=('sing-box: Serves the dashboard via experimental.clash_api external_ui')
# Upstream publishes no tags or releases. The gh-pages branch is auto-deployed
# from main by CI, so pkgver is the commit date and the source is pinned to a
# commit for reproducibility.
#
# To update:
#   1. gh api repos/SagerNet/sing-box-dashboard/commits/gh-pages --jq '.[0]'
#      (or: git ls-remote https://github.com/SagerNet/sing-box-dashboard gh-pages)
#   2. Set _commit to the new SHA and pkgver to YYYY.MM.DD of its committer date.
#   3. makepkg -Ge && makepkg -si --noconfirm   (updates the sha256sums for you)
_commit=1f56683b9adf952b47957f5bb758d9ca7837cef0
_repo=SagerNet/sing-box-dashboard
source=("$pkgname-${_commit}.zip::https://github.com/$_repo/archive/$_commit.zip")
sha256sums=('af9317d9a86a8d37a44e11cd391e2e1d1d82c4a761d99c398ed473e2fbf9fc4f')

package() {
	# The archive nests everything under sing-box-dashboard-<sha>/, so
	# --strip-components=1 is required to land index.html at the top level.
	install -d "$pkgdir/usr/share/$pkgname"
	bsdtar -xf "$pkgname-${_commit}.zip" \
		--strip-components=1 \
		-C "$pkgdir/usr/share/$pkgname"
}
