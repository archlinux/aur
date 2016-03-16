# Maintainer: jdn06 <jdn06.jdn06@outlook.fr>
pkgname=aqualung-git
_pkgname=aqualung
pkgver=2016.03
pkgrel=1
pkgdesc="High quality music player w/ gapless support"
arch=('i686' 'x86_64')
url="http://aqualung.jeremyevans.net/"
license=('GPL')

# You chan change depencies if you modify consequently flags of ./configure below
# Refer to http://aqualung.jeremyevans.net/compiling/
depends=('gtk2' 'libxml2' 'lua52' 'libpulse' 'jack' 'lame' 'speex' 'wavpack' 'liboggz' 'libcdio-paranoia' 'libmpcdec' 'libmad' 'libmodplug')
makedepends=('git')

optdepends=('liblrdf: LADSPA filters'
    'libcddb: CDDB / FreeDB support'
    'libsamplerate: high quality Sample Rate Conversion'
    "libifp: iRiver's iFP support"
    "libsndfile: Uncompressed audio decode & WAV output"
    "flac: FLAC support (play & encode)"
    "libvorbis: Vorbis support (play & encode)"
    "wavpack: WavPpack support (playback)"
    "sndio: outputs via sndio"
)
provides=(aqualung)
conflicts=(aqualung)

source=("$_pkgname"::"git://github.com/jeremyevans/$_pkgname.git")
sha256sums=(SKIP)

pkgver() {
	cd "$_pkgname"
	git describe --tags | sed 's/-//g'
}

build() {
	cd "$_pkgname"
	sh autogen.sh
	./configure --prefix=/usr --without-mac --without-lavc --without-ladspa
	make
}

check() {
	cd "$_pkgname"
	make -k check
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}

