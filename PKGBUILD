# shellcheck shell=tcl disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=tcl-prompt
pkgname=$_pkgname-git
pkgver=r2.6e141e8
pkgrel=1
pkgdesc="A powerlevel10k-like prompt of tcl."
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname
license=(GPL3)
depends=(tcl lsb-release procps-ng)
optdepends=(expect vitis vivado)
makedepends=(git)
source=("git+$url#tag=6e141e898dd0149bc4b5cb9b8d5fcd2f9a96c5ad")
sha256sums=(SKIP)

pkgver() {
	cd "$_pkgname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname" || return 1

	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	install -d "$pkgdir/usr/lib"
	cp -r modules "$pkgdir/usr/lib/$_pkgname"
	cp -r bin "$pkgdir/usr"
}
