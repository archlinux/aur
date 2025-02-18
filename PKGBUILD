# Maintainer: Foxe Chen <chen.foxe@gmail.com>
pkgname=browser-on-ram-git
pkgver=v1.1.r2.a921454
pkgrel=1
pkgdesc="Synchronizes browser related directories to RAM"
arch=(any)
url="https://github.com/64-bitman/browser-on-ram"
license=('MIT')
depends=('libcap' 'rsync')
makedepends=('git')
provides=("browser-on-ram")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	RELEASE=1 make
}

package() {
	cd "$srcdir/${pkgname%-git}"

    RELEASE=1 PREFIX="${pkgdir}/usr" make install
    PREFIX="${pkgdir}/usr" make install-cap
}
