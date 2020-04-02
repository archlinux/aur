# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-gl
pkgver=0.6.0
pkgrel=1
url=https://github.com/Igalia/cog
arch=(i686 x86_64 aarch64 armv7l armv7h)
groups=(wpe)
conflicts=(cog-git)
depends=('wpewebkit' 'wpebackend-fdo>=1.6.0' libinput)
makedepends=(cmake wayland-protocols)
license=(custom:MIT)
source=("https://wpewebkit.org/releases/cog-${pkgver}.tar.xz"
        "https://wpewebkit.org/releases/cog-${pkgver}.tar.xz.asc")
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')
md5sums=('a97df4f0e2d25f4da7cd9bb55294d30e' 'SKIP')
sha1sums=('9392d9251bab8a9f61d00297707e16a983127eae' 'SKIP')
sha256sums=('208f58e0533b269400875237a95e994c93da7234a29fd1c904e756b88963e35d' 'SKIP')

build () {
	cmake -H"cog-${pkgver}" -Bbuild \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCOG_PLATFORM_FDO=ON \
		-DCOG_PLATFORM_DRM=ON \
		-DCOG_BUILD_PROGRAMS=ON \
		-DINSTALL_MAN_PAGES=ON \
		-DCOG_WESTON_DIRECT_DISPLAY=OFF  # Needs libweston-9-protocols
	cmake --build build
}

package () {
	DESTDIR="${pkgdir}" cmake --build build --target install

	install -Dm644 "cog-${pkgver}/COPYING" \
		"${pkgdir}/usr/share/licenses/cog/COPYING"
}
