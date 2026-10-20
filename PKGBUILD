# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=platform-profile-daemon
pkgver=1.1.1
pkgrel=1
pkgdesc='Minimal Power Profiles D-Bus for AMD Dynamic EPP via platform profiles'
arch=('x86_64')
url='https://codeberg.org/nathawat/platform-profile-daemon'
license=('Apache-2.0')
depends=('dbus' 'polkit' 'systemd')
makedepends=('pkgconf' 'zig>=0.17.0' 'zig<0.18.0')
provides=('power-profiles-daemon')
conflicts=('power-profiles-daemon')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('c90b4449a0598841a9bd8fb29a3171d96129aa7e2bbc87276c69c1ef77d2f84588d23e30ed99212a059078e8e85d9eb7c2fd90ee4cbd7623d8c55d333d894e70')

build() {
	cd "$pkgname"
	zig build -Doptimize=ReleaseSmall
}

check() {
	cd "$pkgname"
	zig build test
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" zig build install -Doptimize=ReleaseSmall --prefix /usr
}
