# shellcheck shell=tcl disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=tcl-prompt
pkgname=$_pkgname-git
pkgver=r4.e86fa1d
pkgrel=1
pkgdesc="A powerlevel10k-like prompt of tcl."
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname
license=(GPL3)
depends=(tcl tclreadline tcllib lsb-release procps-ng)
optdepends=(expect vitis vivado)
makedepends=(git)
source=("git+$url#tag=e86fa1d48fc0719e9dc85d80851f6a260dc975ae")
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
