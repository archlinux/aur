# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=rhvoice
pkgver=1.2.2
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
sha512sums=('b07582698dc5d26c3f573ff1690991222e06873fa024666d7741b4f8e04f509832b10a5c5c0dd4af17a86117387a6a359d17bccf1353093757316e1f8ff2fa95')

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
