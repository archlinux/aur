# shellcheck shell=tcl disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=tcl-prompt
pkgname=$_pkgname-git
pkgver=r16.d5d8b66
pkgrel=1
pkgdesc="A powerlevel10k-like prompt of tcl."
arch=(any)
url=https://github.com/wakatime/$_pkgname
license=(GPL3)
depends=(tcl tclreadline tcllib lsb-release procps-ng)
optdepends=(expect vitis vivado)
makedepends=(git)
source=("git+$url#tag=d5d8b66f69837b1444b14a60018fd1c93af5a7be")
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
