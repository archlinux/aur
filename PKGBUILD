# Maintainer: robertfoster
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Andrew Stubbs <andrew.stubbs at gmail dot com>

pkgname=mimic1
pkgver=1.3.0.1
pkgrel=1
pkgdesc="Text-to-speech voice synthesis from the Mycroft project."
arch=(x86_64 i686)
url="https://mimic.mycroft.ai/"
license=('custom')
depends=(alsa-lib)
makedepends=('git' 'libtool' 'autoconf' 'automake' 'icu')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MycroftAI/${pkgname}/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr \
    --disable-lang-indic
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('9041f5c7d3720899c90c890ada179c92c3b542b90bb655c247e4a4835df79249')
