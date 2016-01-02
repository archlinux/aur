# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=ffmpeg-full-git-doc
pkgver=N.77668.g7812997
pkgrel=1
pkgdesc="FFmpeg documentation from Git repository"
arch=('any')
url="http://www.ffmpeg.org/"
license=('GPL')
makedepends=('git')
conflicts=(
    'ffmpeg' 'ffmpeg-git' 'ffmpeg-full' 'ffmpeg-full-extra' 'ffmpeg-full-nvenc'
    'ffmpeg-libfdk_aac')
source=("$pkgname"::'git://source.ffmpeg.org/ffmpeg.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

        # Git, tags available
        
	# Method showing version based on Arch Linux Wiki recommendations.
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
	
	# Method showing version based on FFmpeg Git versioning. Preferred.
	printf "%s" "$(git describe --tags --match N | tr '-' '.')"

}

build() {
	cd "${srcdir}/${pkgname}"
	
	msg "Running ffmpeg configure script. Please wait..."
	
        ./configure \
                --prefix=/usr \
                --enable-gpl \
                --disable-manpages \
                --disable-podpages
	
	make doc
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="$pkgdir/" install-doc
}
