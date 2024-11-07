# Maintainer: k1f0 <archlinux at k1f0.mozmail.com>

pkgname=signalbackup-tools-git
pkgver=20241106.1.r0.g242c983
pkgrel=1
pkgdesc="Tool to work with Signal Backup files"
arch=('x86_64')
url="https://github.com/bepaald/signalbackup-tools"
license=('GPL3')
depends=('openssl' 'sqlite' 'dbus')
makedepends=('git' 'pkgconfig' 'cmake')
provides=("signalbackup-tools")
conflicts=()
source=("git+https://github.com/bepaald/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	cmake -B output -DCMAKE_BUILD_TYPE=Release
	cmake --build output -j $(nproc)
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	install -Dm755 "output/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
