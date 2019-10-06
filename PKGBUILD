# Maintainer: alex19EP <aarnaarn2@gmail.com>
# Maintainer: vantu5z <vantu5z@mail.ru>
# Contributor: der_fenix <derfenix@gmail.com>

pkgname=rhvoice-git
pkgver=1.0.0.r4.d96020c
pkgrel=1
pkgdesc="Free and open source speech synthesizer for Russian and other languages. (development version)"
arch=('x86_64')
url="https://github.com/Olga-Yakovleva/RHVoice"
license=('GPL3')
depends=('libpulse')
makedepends=('git' 'scons' 'python-lxml')
optdepends=('rhvoice-dictionary-git: extended russian dictionary'
	'speech-dispatcher: for speech-dispatcher module support'
	'portaudio: for portaudio backend'
	'libao: for ao backend')
provides=('rhvoice')
conflicts=('rhvoice')
backup=('etc/RHVoice/RHVoice.conf')
source=('git+https://github.com/Olga-Yakovleva/RHVoice.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/RHVoice"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/RHVoice"
	scons prefix="/usr" sysconfdir="/etc"
}

package() {
	cd "$srcdir/RHVoice"
	mkdir -p "${pkgdir}/usr/lib/speech-dispatcher-modules"
	scons install DESTDIR="${pkgdir}" prefix="/usr" sysconfdir="/etc"
	ln -s "/usr/bin/sd_rhvoice" "${pkgdir}/usr/lib/speech-dispatcher-modules/sd_rhvoice"
}
