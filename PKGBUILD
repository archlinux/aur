# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

# Contributor: Christian Hesse <mail@eworm.de
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>

pkgname=squeezelite-r2-git
pkgver=v1.8.2.R2.r1.g681fc3d
pkgrel=1
pkgdesc='Lightweight headless squeezebox emulator - version r2'
arch=('i686' 'x86_64' 'armv6h')
url='http://www.marcoc1712.it/'
license=(GPL3)
depends=('alsa-lib')
makedepends=('git' 'alsa-lib' 'faad2' 'flac' 'libmad' 'libvorbis' 'mpg123'
	'portaudio')
optdepends=('faad2: Support for decoding AAC'
	'flac: Support for decoding FLAC'
	'libmad: Support for decoding MP3'
	'libvorbis: Support for decoding Ogg Vorbis'
	'mpg123: Support for decoding MP3'
	'portaudio: Use of binary using portaudio for output')
provides=('squeezelite')
conflicts=('squeezelite')
source=('git+https://github.com/marcoc1712/squeezelite-R2')
sha256sums=('SKIP')

pkgver() {
  cd squeezelite-R2/
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/\(//g;s/\)//g'
}

build() {
	cd squeezelite-R2/

	# build squeezelite
	make

}

package() {
	cd squeezelite-R2/

	# Install binaries
	install -Dm755 squeezelite-R2 "${pkgdir}/usr/bin/squeezelite-r2"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	
}

