# Maintainer :
# Contributor : Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor : Dylan Whichard <dylan at whichard dot com>
_pkgname=Asterisk-eSpeak
pkgname=asterisk-espeak
_pkgver=5.0-rc1
pkgver=5.0
pkgrel=3
pkgdesc='Asterisk module that provides the "eSpeak" dialplan application. It allows you to use the eSpeak text to speech synthesizer.'
arch=('i686' 'x86_64')
url='https://github.com/zaf/asterisk-espeak'
license=('GPL-2.0-only')
depends=('asterisk>=15' 'espeak-ng' 'libsamplerate' 'glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zaf/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('e9d4cd5dd2e3227b9def7f93fbab58838409f43d5ab45f09ba6856df8e15f1023b4a32e0f3c89faeba7dc44f340a9715725e60320bb4bf8996aa7fbff0c08a96')
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
