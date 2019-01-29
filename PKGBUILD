# Maintainer: Austin Haedicke

# If you find errors or have suggestions feel free to file an issue
# or submit a pull request @ https://github.com/savagezen/pkgbuild

pkgname=cmus-git
pkgver=v2.8.0.r0.g65d36d5
pkgrel=1
pkgdesc="A very feature-rich ncurses-based music player"
arch=('i686' 'x86_64')
url="https://cmus.github.io/"
depends=('ncurses')
makedepends=('git')
optdepends=('alsa-lib: ALSA output plugin support'
		'aRts: aRts'
		'faad2: .aac, .mp4, .m4a, .m4b'
		'ffmpeg: .ffmpeg, .wma, .ape, .mka, .tta, .shn'
		'flac: .flac'
		'libavcodec: .wma, .ape, .mka, .tta, .shn'
		'libao: for AO output plugin support'
		'libcddb: .cdio'
		'libcdio: .cdio'
		'libcdio-paranoia: .cdio'
		'libcue: .cue'		
		'libmad: .mp3'
		'libmikmod: .mod, .s3m'
		'libmodplug: .mod, .s3m'
		'libmp4v2: .mp4, .m4a, .m4b'
		'libmpcdec: .mpc, .mpp, .mp+'
		'libpulse: for Pulse Audio output plugin support'
		'libraor: RoarAudio'
		'libvorbis: .ogg'
		'opusfile: .opus'
		'oss: OSS'
		'wavpack: .wv')
conflicts=('cmus')
provides=('cmus')
license=('GPL')
source=(git://github.com/cmus/cmus)
sha512sums=('SKIP')
_gitname=cmus

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  ./configure prefix=/usr
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}
