# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>
pkgname=git-whoami-git
_pkgname="${pkgname%-git}"
pkgver=r3.5d77e00
pkgrel=3
pkgdesc='The `whoami` command, but for Git. Useful when working with multiple identities.'
arch=("any")
url="https://github.com/petere/git-whoami"
license=("custom:WTFPL")
depends=("git")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
    "$_pkgname::git+$url.git#branch=master"
    "LICENSE"
)
sha256sums=('SKIP'
            '0356258391e190dc1d44ea01565cfe627fe44e27dad693a0a54c2483a7b223e5')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm644 -t $pkgdir/usr/share/licenses/$_pkgname/ LICENSE

	cd "$srcdir/$_pkgname"
	install -Dm755 -t $pkgdir/usr/bin/ $_pkgname
}
