# Maintainer: Lauri Niskanen <ape@ape3000.com>
# Maintainer: Michael Barbour <barbour.michael.0@gmail.com>
# Contributor: sekret

pkgname=dsp-git
_pkgname=dsp
pkgver=327.42fb208
pkgrel=1
pkgdesc="An audio processing program with an interactive mode"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/bmc0/${_pkgname}"
license=('ISC')
makedepends=('git' 'ladspa')
depends=('fftw' 'libsndfile' 'ffmpeg' 'alsa-lib' 'libao' 'libmad' 'libpulse' 'zita-convolver' 'libltdl')
source=("git+https://github.com/bmc0/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
