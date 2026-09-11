# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=platform-profile-daemon
pkgver=1.1.0
pkgrel=1
pkgdesc='Minimal Power Profiles D-Bus for AMD Dynamic EPP via platform profiles'
arch=('x86_64')
url='https://codeberg.org/nathawat/platform-profile-daemon'
license=('Apache-2.0')
depends=('dbus' 'polkit' 'systemd')
makedepends=('pkgconf' 'zig')
provides=('power-profiles-daemon')
conflicts=('power-profiles-daemon')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('39a021f0230d2390baf781880d12a9d8c54b3f72a9947e4d512cd90f07608e8242644cdb1e5b6d33f655f90037205c6f4652b927a535ff284040e12822e72a94')

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
