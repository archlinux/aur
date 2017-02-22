# Maintainer: Lauri Niskanen <ape@ape3000.com>
# Maintainer: Michael Barbour <barbour.michael.0@gmail.com>
# Contributor: sekret

pkgname=dsp-git
_pkgname=dsp
pkgver=242.af2f290
pkgrel=1
pkgdesc="An audio processing program with an interactive mode"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/bmc0/${_pkgname}"
license=('ISC' 'GPL2' 'LGPL2.1')
makedepends=('git')
depends=('fftw' 'libsndfile' 'ffmpeg' 'alsa-lib' 'libao' 'libmad' 'libpulse' 'ladspa' 'zita-convolver')
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
	install -Dm644 LICENSE.GPL2 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.GPL2"
	install -Dm644 LICENSE.LGPL2_1 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.LGPL2_1"
}
