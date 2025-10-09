# Maintainer: Yamada Hayao <shun819.mail@gmail.com>

pkgname="intel-vision-drivers-dkms-git"
_pkgname=vision-drivers
pkgver=r48.92a717e
pkgrel=1
pkgdesc="Intel Vision Driver on Intel Lunar Lake (LNL) CVS-enabled Platforms"
arch=('x86_64')
url="https://github.com/intel/$_pkgname"
license=('GPL-2.0')
depends=('glibc')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')
provides=('intel-vision-drivers-dkms')

pkgver() {
	cd "$_pkgname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	sed -i "s/^PACKAGE_VERSION=\".*\"$/PACKAGE_VERSION=\"$pkgver\"/g" ./dkms.conf
}

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/src"
	cp -rT "$_pkgname" "$pkgdir/usr/src/$_pkgname-$pkgver"
}
