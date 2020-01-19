# Maintainer : Dylan Whichard <dylan at whichard dot com>
_pkgname=Asterisk-eSpeak
pkgname=asterisk-espeak
_pkgver=5.0-rc1
pkgver=5.0
pkgrel=1
pkgdesc='Asterisk module that provides the "eSpeak" dialplan application. It allows you to use the eSpeak text to speech synthesizer.'
arch=('i686' 'x86_64')
url='https://github.com/zaf/asterisk-espeak'
license=('GPL2')
depends=('asterisk>=15' 'espeak' 'libsamplerate' 'libsndfile')
source=("https://github.com/zaf/${pkgname}/archive/v${_pkgver}.tar.gz")
sha512sums=('cc8b646e3e050256b729f9666f11c8db583553cb15f1ee8aa9fde07272f3d59ba9b2775d110c4f629cb263205432c8c1ed9b4122bba4622970ff2cd5f4a51e5d')
backup=('etc/asterisk/espeak.conf')

build() {
  find .
  cd "$srcdir/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  
  make DESTDIR="$pkgdir" ASTLIBDIR="/usr/lib/asterisk/modules" install || return 1
  make DESTDIR="$pkgdir" samples || return 1
}
