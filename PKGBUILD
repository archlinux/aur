# Maintainer : Dylan Whichard <dylan at whichard dot com>
_pkgname=Asterisk-eSpeak
pkgname=asterisk-espeak
pkgver=2.2
pkgrel=1
pkgdesc='Asterisk module that provides the "eSpeak" dialplan application. It allows you to use the eSpeak text to speech synthesizer.'
arch=('i686' 'x86_64')
url='https://github.com/zaf/asterisk-espeak'
license=('GPL2')
depends=('asterisk>=1.6' 'espeak' 'libsamplerate' 'libsndfile')
source=("https://github.com/zaf/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('54dd328122237ca604835123c7073fe450df8b6e')
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
