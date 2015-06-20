pkgname=simplescreenrecorder-git
pkgver=0.0.0
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
makedepends=("git")
conflicts=("simplescreenrecorder")
provides=("simplescreenrecorder")
options=("!libtool")
install=simplescreenrecorder-git.install

pkgver() {
	cd "${srcdir}/ssr"
	# Use the tag of the last commit
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
build() {
	cd "${srcdir}/ssr"
	./configure --prefix=/usr --disable-assert
	make
}
package() {
	cd "${srcdir}/ssr"
	make DESTDIR="${pkgdir}" install
}
