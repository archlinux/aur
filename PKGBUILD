# Maintainer: Coelacanthus <coelacanthus@outlook.com>

pkgname=gomclauncher
pkgver=1.3.9
pkgrel=1
epoch=
pkgdesc='gml: A Minecraft Launcher'
arch=('x86_64' 'i386')
url='https://github.com/xmdhs/gomclauncher'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xmdhs/gomclauncher/archive/v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/xmdhs/gomclauncher/v$pkgver/LICENSE")

b2sums=('a9023012e56b789ff252aadcca2cef191478c353405116b1ef91399548d7fbafb0fdf9ea9391e14e0851f2b8f08a3078a9c3d16f900edf59630b14c4e0a78327'
        'c0f4f5d14632f9204183a7096221aa794a20c34319abbbe527d1ca8bd234b3e744e23b398a73da64837396128dba466f7cfa93787f7b33dc05e1b90f70f7d579')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

package() {
	cd "$pkgname-$pkgver"

	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		-o build \
		.

	install -Dm755 build/gomclauncher "$pkgdir/usr/bin/gml"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/gomclauncher/LICENSE"
}
