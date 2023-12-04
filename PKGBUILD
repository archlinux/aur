# shellcheck shell=tcl disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=tcl-prompt
pkgname=$_pkgname-git
pkgver=r11.6e1525a
pkgrel=1
pkgdesc="A powerlevel10k-like prompt of tcl."
arch=(any)
url=https://github.com/wakatime/$_pkgname
license=(GPL3)
depends=(tcl tclreadline tcllib lsb-release procps-ng)
optdepends=(expect vitis vivado)
makedepends=(git)
source=("git+$url#tag=6e1525a0dd0fa00cbbb2d9cf4ba5c3c669e859c7")
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
