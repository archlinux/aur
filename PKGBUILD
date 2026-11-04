# Maintainer: Scott <158021536+nathawatc@users.noreply.github.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=platform-profile-daemon
pkgver=1.1.2
pkgrel=1
pkgdesc='Minimal Power Profiles D-Bus for AMD Dynamic EPP via platform profiles'
arch=('x86_64')
url='https://github.com/nathawatc/platform-profile-daemon'
license=('Apache-2.0')
depends=('dbus' 'polkit' 'systemd')
makedepends=('zig>=0.17.0' 'zig<0.18.0')
provides=('power-profiles-daemon')
conflicts=('power-profiles-daemon')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('ee8a439fc8093fbe42261e88049c3b0cbf8a47486a840d2ca3f1bc5eca4ac5ca14857a5efc8eabab4fc0c6c4f95c943ace3a941658735d8f3aafa815f344a102')

build() {
	cd "$pkgname"-"$pkgver"
	zig build
}

check() {
	cd "$pkgname"-"$pkgver"
	zig build test
}

package() {
	cd "$pkgname"-"$pkgver"
	DESTDIR="$pkgdir" zig build install --prefix /usr
}
