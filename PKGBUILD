pkgname=simplescreenrecorder-git
pkgver=0.3.8.r89.g2edb032
pkgrel=1
pkgdesc="A feature-rich screen recorder that supports X11 and OpenGL. (Git version)"
arch=("i686" "x86_64")
url="http://www.maartenbaert.be/simplescreenrecorder/"
license=("GPL3")
source=("git+https://github.com/MaartenBaert/ssr.git")
md5sums=("SKIP")
depends=("qt4" "ffmpeg" "alsa-lib" "libpulse" "jack" "libgl" "glu" "libx11" "libxfixes" "libxext" "libxi")
if test "$CARCH" == x86_64; then
	optdepends=("lib32-simplescreenrecorder-git: OpenGL recording of 32-bit applications")
fi
makedepends=("git" "cmake")
conflicts=("simplescreenrecorder")
provides=("simplescreenrecorder")
install=simplescreenrecorder-git.install

pkgver() {
	cd "${srcdir}/ssr"
	# Use the tag of the last commit
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
build() {
	cd "${srcdir}/ssr"
	cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR="/usr/lib" -DCMAKE_BUILD_TYPE=Release .
	make
}
package() {
	cd "${srcdir}/ssr"
	make DESTDIR="${pkgdir}" install
}
