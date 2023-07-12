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
sha256sums=('35d6aca3075cf81c393b662990bf7a859afaab1a5be984ee32873f4e7d665fc7')

build() {
	cd "$pkgname-$pkgver" || exit 1
	cmake -DCMAKE_INSTALL_PREFIX=/usr -Bbuild
	cmake --build build
}

package() {
	cd "$pkgname-$pkgver" || exit 1
	DESTDIR="$pkgdir" cmake --install build
}
