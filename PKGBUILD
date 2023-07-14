# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=lyokha/g3kb-switch
_source_type=github-releases
_upstreamver='1.3'

pkgname=g3kb-switch
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="CLI keyboard layout switcher for GNOME Shell"
arch=(x86 x86_64 arm aarch64)
url=https://github.com/$_repo
depends=(glib2)
makedepends=(cmake)
license=(bsd)
source=("$pkgname-$pkgver::$url/archive/$_upstreamver.tar.gz")
sha256sums=('d3ca6c943c6733a20a1135d7f4f6f29f0ddfe5502decb36958171ebdfdb96b8a')

build() {
	cd "$pkgname-$pkgver" || exit 1
	cmake -DCMAKE_INSTALL_PREFIX=/usr -Bbuild
	cmake --build build
}

package() {
	cd "$pkgname-$pkgver" || exit 1
	DESTDIR="$pkgdir" cmake --install build
}
