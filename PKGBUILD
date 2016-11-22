# Maintainer: Lauri Niskanen <ape@ape3000.com>
# Contributor: sekret

pkgname=dsp-git
_pkgname=dsp
pkgver=234.25a4b3e
pkgrel=1
pkgdesc="An audio processing program with an interactive mode"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/bmc0/${_pkgname}"
license=('ISC')
makedepends=('git' 'fftw' 'libsndfile' 'ffmpeg' 'alsa-lib' 'libao' 'libmad' 'libpulse' 'ladspa' 'zita-convolver')
optdepends=('fftw: For resample and fir effects'
            'libsndfile: For sndfile input/output support'
            'ffmpeg: For ffmpeg input support'
            'alsa-lib: For alsa input/output support'
            'libao: For ao output support'
            'libmad: For mp3 input support'
            'libpulse: For PulseAudio input/ouput support'
            'ladspa: For building the LADSPA frontend'
            'zita-convolver: For zita_convolver effect')
source=(${_pkgname}::"git+https://github.com/bmc0/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure --prefix=/usr
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
