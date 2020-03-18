# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=rhvoice
pkgver=1.0.0
pkgrel=1
pkgdesc="Free and open source speech synthesizer for Russian and other languages."
arch=('x86_64')
url="https://github.com/Olga-Yakovleva/RHVoice"
license=('GPL3')
depends=('speech-dispatcher' 'libpulse')
makedepends=('scons' 'python-lxml' 'portaudio' 'libao')
optdepends=('portaudio: for portaudio backend'
	'libao: for ao backend')
provides=('rhvoice')
conflicts=('rhvoice')
backup=('etc/RHVoice/RHVoice.conf')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Olga-Yakovleva/RHVoice/archive/$pkgver.tar.gz)
sha512sums=('4443e0d7836387eb4d45969f48263d6e53e0042f4e08f63e15655e0c875d74b5baf3a0a53ff1008177a281a8463d9f5a86ca7eb261ecf34ed9029c520f8c7b16')

build() {
	cd "$srcdir/RHVoice-$pkgver"
	scons prefix="/usr" sysconfdir="/etc"
}

package() {
	cd "$srcdir/RHVoice-$pkgver"
	mkdir -p "${pkgdir}/usr/lib/speech-dispatcher-modules"
	scons install DESTDIR="${pkgdir}" prefix="/usr" sysconfdir="/etc"
	ln -s "/usr/bin/sd_rhvoice" "${pkgdir}/usr/lib/speech-dispatcher-modules/sd_rhvoice"
}
